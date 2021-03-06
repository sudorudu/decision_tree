import numpy as np
import datetime

from sklearn.model_selection import GridSearchCV, ParameterGrid
from sklearn.ensemble import RandomForestClassifier
from sklearn.tree import DecisionTreeClassifier
from sklearn import metrics
from sklearn.metrics import classification_report

# TODO(MF): original parfit did not work correctly with our data
# from parfit.parfit import bestFit, plotScores
from decision_trees.own_parfit.parfit import bestFit

from decision_trees.utils.constants import ClassifierType
from decision_trees.utils.constants import GridSearchType
from decision_trees.utils.constants import get_classifier, get_tuned_parameters
from decision_trees.utils.convert_to_fixed_point import quantize_data


def perform_gridsearch(train_data: np.ndarray, train_target: np.ndarray,
                       test_data: np.ndarray, test_target: np.ndarray,
                       number_of_bits_per_feature_max: int,
                       clf_type: ClassifierType,
                       gridsearch_type: GridSearchType,
                       path: str
                       ):
    filename = datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S") + "_gridsearch_results.txt"

    # first train on the non-qunatized data
    if gridsearch_type == GridSearchType.SCIKIT:
        best_model, best_score = _scikit_gridsearch(train_data, train_target, test_data, test_target, clf_type)
    elif gridsearch_type == GridSearchType.PARFIT:
        best_model, best_score = _parfit_gridsearch(train_data, train_target, test_data, test_target, clf_type, False)
    elif gridsearch_type == GridSearchType.NONE:
        best_model, best_score = _none_gridsearch(train_data, train_target, test_data, test_target, clf_type)
    else:
        raise ValueError('Requested GridSearchType is not available')

    print('No quantization - full resolution')
    _save_score_and_model_to_file(best_score, best_model, filename)

    # repeat on quantized data with different number of bits
    for i in range(number_of_bits_per_feature_max, 0, -1):
        train_data_quantized, test_data_quantized = quantize_data(train_data, test_data, i, False, "./../../data/")

        if gridsearch_type == GridSearchType.SCIKIT:
            best_model, best_score = _scikit_gridsearch(train_data_quantized, train_target, test_data, test_target, clf_type)
        elif gridsearch_type == GridSearchType.PARFIT:
            best_model, best_score = _parfit_gridsearch(
                train_data_quantized, train_target,
                test_data_quantized, test_target,
                clf_type, False
            )
        elif gridsearch_type == GridSearchType.NONE:
            best_model, best_score = _none_gridsearch(train_data_quantized, train_target, test_data, test_target, clf_type)
        else:
            raise ValueError('Requested GridSearchType is not available')
        print(f'number of bits: {i}')
        _save_score_and_model_to_file(best_score, best_model, path + "/" + filename)


def _save_score_and_model_to_file(score, model, fileaname: str):
    print(f"f1: {score:{1}.{5}}: {model}")
    with open(fileaname, "a") as f:
        print(f"f1: {score:{1}.{5}}: {model}", file=f)


# this should use the whole data available to find best parameters. So pass both train and test data, find parameters
# and then retrain with found parameters on train data
def _scikit_gridsearch(
        train_data: np.ndarray, train_target: np.ndarray,
        test_data: np.ndarray, test_target: np.ndarray,
        clf_type: ClassifierType
):
    # perform grid search to find best parameters
    scores = ['neg_mean_squared_error'] if clf_type == ClassifierType.RANDOM_FOREST_REGRESSOR else ['f1_weighted']
    # alternatives: http://scikit-learn.org/stable/modules/model_evaluation.html#common-cases-predefined-values

    tuned_parameters = get_tuned_parameters(clf_type)

    # for score in scores:
    score = scores[0]

    # print("# Tuning hyper-parameters for %s" % score)
    # print()

    # TODO: important note - this does not use test data to evaluate, instead it probably splits the train data
    # internally, which means that the final scor will be calculated on this data and is different than the one
    # calculated on test data

    if clf_type == ClassifierType.DECISION_TREE:
        clf = GridSearchCV(DecisionTreeClassifier(), tuned_parameters, cv=5, scoring=f'{score}', n_jobs=3)
    elif clf_type == ClassifierType.RANDOM_FOREST:
        clf = GridSearchCV(RandomForestClassifier(), tuned_parameters, cv=5, scoring=f'{score}', n_jobs=3)
    else:
        raise ValueError("Unknown classifier type specified")

    clf = clf.fit(train_data, train_target)

    clf.score(test_data, test_target)

    expected, predicted = test_target, clf.predict(test_data)
    f1_score = metrics.f1_score(expected, predicted, average='weighted')
    print(f1_score)
    classification_report(expected, predicted)

    # print("Best parameters set found on development set:")
    # print(clf.best_params_)
    # print()
    # print("Grid scores on development set:")
    # for mean, std, params in zip(
    #         clf.cv_results_['mean_test_score'],
    #         clf.cv_results_['std_test_score'],
    #         clf.cv_results_['params']
    # ):
    #     print("%0.3f (+/-%0.03f) for %r"
    #           % (mean, std * 2, params))
    # print()

    return clf.best_params_, clf.best_score_


def _none_gridsearch(
        train_data: np.ndarray, train_target: np.ndarray,
        test_data: np.ndarray, test_target: np.ndarray,
        clf_type: ClassifierType
):
    clf = get_classifier(clf_type)

    clf = clf.fit(train_data, train_target)

    return clf.get_params(), clf.score(test_data, test_target)


# TODO(MF): check parfit module for parameters search
# https://medium.com/mlreview/parfit-hyper-parameter-optimization-77253e7e175e
def _parfit_gridsearch(
        train_data: np.ndarray, train_target: np.ndarray,
        test_data: np.ndarray, test_target: np.ndarray,
        clf_type: ClassifierType,
        show_plot: bool
):
    grid = get_tuned_parameters(clf_type)

    best_model, best_score, all_models, all_scores = bestFit(RandomForestClassifier, ParameterGrid(grid),
                                                             train_data, train_target, test_data, test_target,
                                                             predictType='predict',
                                                             metric=f1_score, bestScore='max',
                                                             scoreLabel='f1_weighted', showPlot=show_plot)

    return best_model, best_score