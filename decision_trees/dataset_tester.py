import time
import datetime
from enum import Enum

import numpy as np
from sklearn import metrics
from sklearn.ensemble import RandomForestClassifier
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import GridSearchCV
from sklearn.tree import DecisionTreeClassifier

from decision_trees.tree import RandomForest
from decision_trees.tree import Tree

from decision_trees.utils.convert_to_fixed_point import convert_to_fixed_point


class ClassifierType(Enum):
    decision_tree = 1
    random_forest = 2
    random_forest_regressor = 3


def perform_experiment(train_data: np.ndarray, train_target: np.ndarray,
                       test_data: np.ndarray, test_target: np.ndarray,
                       number_of_bits_per_feature_max: int
                       ):
    clf_type = ClassifierType.random_forest
    filename = datetime.datetime.now().strftime("%Y_%m_%d_%H_%M_%S") + "_gridsearch_results.txt"

    # first train on the non-qunatized data
    # clf = grid_search(train_data, train_target, test_data, test_target, clf_type)
    # print(f"f: {clf.best_score_:{1}.{5}} - {clf.best_params_}")
    # print(f"f: {clf.best_score_:{1}.{5}} - {clf.best_params_}", file=result_file)

    best_model, best_score = parfit_gridsearch(train_data, train_target, test_data, test_target, clf_type, False)
    print(f"f: {best_score:{1}.{5}}: {best_model}")
    with open(filename, "a") as f:
        print(f"f: {best_score:{1}.{5}}: {best_model}", file=f)

    # repeat on quantized data
    for i in range(number_of_bits_per_feature_max, 0, -1):
        train_data_quantized, test_data_quantized = quantize_data(train_data, test_data, i)

        # clf = grid_search(train_data_quantized, train_target, test_data, test_target, clf_type)
        # print(f"{i}: {clf.best_score_:{1}.{5}}: {clf.best_params_}")
        # print(f"{i}: {clf.best_score_:{1}.{5}}: {clf.best_params_}", file=result_file)

        best_model, best_score = parfit_gridsearch(
            train_data_quantized, train_target,
            test_data_quantized, test_target,
            clf_type, False
        )
        print(f"{i}: {best_score:{1}.{5}} - {best_model}")
        with open(filename, "a") as f:
            print(f"{i}: {best_score:{1}.{5}} - {best_model}", file=f)


def test_dataset(number_of_bits_per_feature: int,
                 train_data: np.ndarray, train_target: np.ndarray,
                 test_data: np.ndarray, test_target: np.ndarray,
                 clf_type: ClassifierType,
                 ):
    # first create classifier from scikit
    if clf_type == ClassifierType.decision_tree:
        clf = DecisionTreeClassifier(criterion="gini", max_depth=None, splitter="random", random_state=42)
    elif clf_type == ClassifierType.random_forest:
        clf = RandomForestClassifier(n_estimators=100, max_depth=None, n_jobs=3, random_state=42)
    elif clf_type == ClassifierType.random_forest_regressor:
        clf = RandomForestRegressor(n_estimators=10, max_depth=None, n_jobs=3, random_state=42)
    else:
        raise ValueError("Unknown classifier type specified")

    # first - train the classifiers on non-quantized data
    print("Non-quantized approach:")

    clf.fit(train_data, train_target)
    test_predicted = clf.predict(test_data)
    print("scikit clf with test data:")
    report_classifier(clf, test_target, test_predicted)

    # perform quantization of train and test data
    # while at some point I was considering not quantizing the test data, I came to a conclusion that it is not the way it will be performed in hardware
    train_data_quantized, test_data_quantized = quantize_data(train_data, test_data, number_of_bits_per_feature)

    #print("Gridsearch")
    #grid_search(train_data_quantized, train_target, ClassifierType.decision_tree)

    print("Parfit test")
    parfit_gridsearch(train_data_quantized, train_target, test_data_quantized, test_target, clf_type, True)

    print("Quantization of data:")
    clf.fit(train_data_quantized, train_target)
    test_predicted_quantized = clf.predict(test_data_quantized)
    print("scikit clf with train and test data quantized:")
    report_classifier(clf, test_target, test_predicted_quantized)

    # generate own classifier based on the one from scikit
    number_of_features = len(train_data[0])
    my_clf = generate_my_classifier(clf, number_of_features, number_of_bits_per_feature)
    my_clf_test_predicted_quantized = my_clf.predict(test_data_quantized)
    print("own clf with train and test data quantized:")
    report_classifier(my_clf, test_target, my_clf_test_predicted_quantized)

    differences_scikit_my = np.sum(test_predicted_quantized != my_clf_test_predicted_quantized)
    print(f"Number of differences between scikit_qunatized and my_quantized: {differences_scikit_my}")

    # check if own classifier works the same as scikit one
    compare_with_own_classifier(
        [test_predicted, test_predicted_quantized, my_clf_test_predicted_quantized],
        ["scikit", "scikit_quantized", "own_clf_quantized"],
        test_target, flag_save_details_to_file=True
    )

    # optionally check the performance of the scikit classifier for reference (does not work for own classifier)
    test_classification_performance(clf, test_data, 10)


def report_classifier(clf, expected, predicted):
    print("Detailed classification report:")

    print("Classification report for classifier %s:\n%s\n"
          % (clf, metrics.classification_report(expected, predicted)))
    print("Confusion matrix:\n%s" % metrics.confusion_matrix(expected, predicted))

    f1_score = metrics.f1_score(expected, predicted, average='weighted')
    precision = metrics.precision_score(expected, predicted, average='weighted')
    recall = metrics.recall_score(expected, predicted, average='weighted')
    accuracy = metrics.accuracy_score(expected, predicted)
    print(f"f1_score: {f1_score:{2}.{4}}")
    print(f"precision: {precision:{2}.{4}}")
    print(f"recall: {recall:{2}.{4}}")
    print(f"accuracy: {accuracy:{2}.{4}}")


def quantize_data(train_data: np.ndarray, test_data: np.ndarray, number_of_bits: int):
    train_data_quantized = np.array([convert_to_fixed_point(x, number_of_bits) for x in train_data])
    test_data_quantized = np.array([convert_to_fixed_point(x, number_of_bits) for x in test_data])

    # with open("quantization_comparision.txt", "w") as file_quantization:
    #     print("Size before quantization: " + str(len(train_data)), file=file_quantization)
    #     print("First element before quantization:\n" + str(train_data[0]), file=file_quantization)
    #     print("Size after quantization: " + str(len(train_data_quantized)), file=file_quantization)
    #     print("First element after quantization:\n" + str(train_data_quantized[0]), file=file_quantization)

    return train_data_quantized, test_data_quantized


def generate_my_classifier(clf, number_of_features, number_of_bits_per_feature: int):
    if isinstance(clf, DecisionTreeClassifier):
        print("Creating decision tree classifier!")
        my_clf = Tree("TreeTest", number_of_features, number_of_bits_per_feature)

    elif isinstance(clf, RandomForestClassifier):
        print("Creating random forest classifier!")
        my_clf = RandomForest("HoG_forest", number_of_features, number_of_bits_per_feature)
    else:
        print("Unknown type of classifier!")
        raise ValueError("Unknown type of classifier!")

    my_clf.build(clf)
    my_clf.print_parameters()
    my_clf.create_vhdl_file()

    return my_clf


def compare_with_own_classifier(results: [], results_names: [str],
                                test_target,
                                flag_save_details_to_file: bool = True
                                ):
    flag_no_errors = True
    number_of_errors = np.zeros(len(results))

    comparision_file = None
    if flag_save_details_to_file:
        comparision_file = open("comparision_details.txt", "w")

    for j in range(0, len(test_target)):
        flag_iteration_error = False

        for i in range(0, len(results)):
            if results[i][j] != test_target[j]:
                number_of_errors[i] += 1
                flag_no_errors = False
                flag_iteration_error = True

        if flag_iteration_error and flag_save_details_to_file:
            print("Difference between versions!", file=comparision_file)
            print("Ground true: " + str(test_target[j]), file=comparision_file)
            for i in range(0, len(results)):
                print(f"{results_names[i]}: {results[i][j]}", file=comparision_file)

    if flag_no_errors:
        print("All results were the same")
    else:
        for i in range(0, len(results)):
            print(f"Number of {results_names[i]} errors: {number_of_errors[i]}")


def test_classification_performance(clf, test_data, number_of_data_to_test=1000, number_of_iterations=1000):
    if number_of_data_to_test <= len(test_data):
        start = time.clock()

        for i in range(0, number_of_iterations):
            for data in test_data[:number_of_data_to_test]:
                clf.predict([data])

        end = time.clock()
        elapsed_time = (end - start)

        print("It takes " +
              '% 2.4f' % (elapsed_time / number_of_iterations) +
              "us to classify " +
              str(number_of_data_to_test) + " data.")
    else:
        print("There is not enough data provided to evaluate the performance. It is required to provide at least " +
              str(number_of_data_to_test) + " values.")


# this should use the whole data available to find best parameters. So pass both train and test data, find parameters
# and then retrain with found parameters on train data
def grid_search(
        train_data: np.ndarray, train_target: np.ndarray,
        test_data: np.ndarray, test_target: np.ndarray,
        clf_type: ClassifierType
):
    # perform grid search to find best parameters
    scores = ['f1_weighted']
    # alternatives: http://scikit-learn.org/stable/modules/model_evaluation.html#common-cases-predefined-values

    # TODO - min_samples_split could be a float (0.0-1.0) to tell the percentage - test it!

    # general observations:
    # for random_forest increasing the min_samples_split decreases performance, checking values above 20 is not useful
    # in general best results are obtained using min_samples_split=2 (default)

    if clf_type == ClassifierType.decision_tree:
        tuned_parameters = [{'max_depth': [10, 20, 50, 100],#[5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100, None],
                             'splitter': ["best"], #, "random"],
                             'min_samples_split': [2, 10],#, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]
                             #'min_samples_split': [0.001, 0.002, 0.003, 0.004, 0.005, 0.01, 0.02, 0.05]
                             'random_state': [42]
                             }]
    elif clf_type == ClassifierType.random_forest:
        tuned_parameters = [{'max_depth': [10, 50, 100, None],
                             'n_estimators': [10, 20, 50, 100, 200],
                             'min_samples_split': [2],
                             #'min_samples_split': [2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 30, 40, 50, 75, 100]
                             #'n_jobs': [-1],
                             'random_state': [42]
                             }]
    else:
        raise ValueError("Unknown classifier type specified")

    #for score in scores:
    score = scores[0]

    # print("# Tuning hyper-parameters for %s" % score)
    # print()

    if clf_type == ClassifierType.decision_tree:
        clf = GridSearchCV(DecisionTreeClassifier(), tuned_parameters, cv=5, scoring=f'{score}', n_jobs=3)
    elif clf_type == ClassifierType.random_forest:
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

    return clf


#from parfit.parfit import bestFit, plotScores
from decision_trees.own_parfit.parfit import bestFit, plotScores
from sklearn.model_selection import ParameterGrid
from sklearn.metrics import *


# TODO(MF): check parfit module for parameters search
# https://medium.com/mlreview/parfit-hyper-parameter-optimization-77253e7e175e
def parfit_gridsearch(
        train_data: np.ndarray, train_target: np.ndarray,
        test_data: np.ndarray, test_target: np.ndarray,
        clf_type: ClassifierType,
        show_plot: bool
):
    if clf_type == ClassifierType.decision_tree:
        grid = {
            'max_depth': [10, 20, 50, 100],
            'splitter': ["best"],
            'min_samples_split': [2, 10],
            'random_state': [42]
        }
    elif clf_type == ClassifierType.random_forest:
        grid = {
            'n_estimators': [10, 20, 50, 100],
            # criterion
            # 'max_features': ['sqrt', 'log2'],
            # 'min_samples_leaf': [1, 5, 10, 25, 50, 100, 125, 150, 175, 200],
            'max_depth': [10, 20, 50, 100, None],
            # 'min_samples_split': [2, 5],#, 10],
            'class_weight': [None],  # , 'balanced'],
            'n_jobs': [-1],
            'random_state': [42]
        }
    else:
        raise ValueError("Unknown classifier type specified")

    paramGrid = ParameterGrid(grid)

    best_model, best_score, all_models, all_scores = bestFit(RandomForestClassifier, paramGrid,
                                                             train_data, train_target, test_data, test_target,
                                                             predictType='predict',
                                                             metric=f1_score, bestScore='max',
                                                             scoreLabel='f1_weighted', showPlot=show_plot)

    return best_model, best_score

# there is no general method for normalisation, so it was moved to be a part of each dataset
def normalise_data(train_data: np.ndarray, test_data: np.ndarray):
    from sklearn import preprocessing

    print("np.max(train_data): " + str(np.max(train_data)))
    print("np.ptp(train_data): " + str(np.ptp(train_data)))

    normalised_1 = 1 - (train_data - np.max(train_data)) / -np.ptp(train_data)
    normalised_2 = preprocessing.minmax_scale(train_data, axis=1)

    print(train_data[0])

    train_data /= 16
    test_data /= 16

    print("Are arrays equal: " + str(np.array_equal(normalised_2, train_data)))
    print("Are arrays equal: " + str(np.array_equal(normalised_1, train_data)))

    for i in range(0, 1):
        print(train_data[i])
        print(normalised_1)
        print(normalised_2)