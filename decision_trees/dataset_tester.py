import time
from enum import Enum

import numpy as np
from sklearn import metrics
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV
from sklearn.tree import DecisionTreeClassifier

from decision_trees.tree import RandomForest
from decision_trees.tree import Tree

from decision_trees.utils.convert_to_fixed_point import convert_to_fixed_point


class ClassifierType(Enum):
    decision_tree = 1
    random_forest = 2


def test_dataset_with_normalization():
    pass


def test_dataset(number_of_bits_per_feature: int,
                 train_data: np.ndarray, train_target: np.ndarray,
                 test_data: np.ndarray, test_target: np.ndarray,
                 clf_type: ClassifierType,
                 flag_quantize_before: bool = True
                 ):
    number_of_features = len(train_data[0])

    # first create classifier from scikit
    if clf_type == ClassifierType.decision_tree:
        clf = DecisionTreeClassifier(criterion="gini", max_depth=10, splitter="random")
    elif clf_type == ClassifierType.random_forest:
        clf = RandomForestClassifier()
    else:
        raise ValueError("Unknown classifier type specified")

    # first - train the classifiers on non-quantized data

    print("Non-quantized approach:")

    clf.fit(train_data, train_target)
    test_predicted = clf.predict(test_data)
    print("scikit clf with test data:")
    report_classifier(clf, test_target, test_predicted)

    # perform quantization of train and test data
    train_data_quantized = np.array([convert_to_fixed_point(x, number_of_bits_per_feature) for x in train_data])
    # TODO - decide what to do with the test data. Should it be quantized or not? I think the test data should not be quantized. Even if it is the results should be the same
    test_data_quantized = np.array([convert_to_fixed_point(x, number_of_bits_per_feature) for x in test_data])

    with open("quantization_comparision.txt", "w") as file_quantization:
        print("Size before quantization: " + str(len(train_data)), file=file_quantization)
        print("First element before quantization:\n" + str(train_data[0]), file=file_quantization)
        print("Size after quantization: " + str(len(train_data_quantized)), file=file_quantization)
        print("First element after quantization:\n" + str(train_data_quantized[0]), file=file_quantization)

    print("Quantization of train data:")
    clf.fit(train_data_quantized, train_target)
    test_predicted = clf.predict(test_data)
    print("scikit clf with test data:")
    report_classifier(clf, test_target, test_predicted)

    # generate own classifier based on the one from scikit
    my_clf = generate_my_classifier(clf, number_of_features, number_of_bits_per_feature)
    my_clf_test_predicted = my_clf.predict(test_data)
    print("own clf with test data:")
    report_classifier(my_clf, test_target, my_clf_test_predicted)

    print("Quantization of train and test data:")
    test_predicted_quantized = clf.predict(test_data_quantized)
    print("scikit clf with test data quantized:")
    report_classifier(clf, test_target, test_predicted_quantized)

    my_clf_test_predicted_quantized = my_clf.predict(test_data_quantized)
    print("own clf with test data quantized:")
    report_classifier(my_clf, test_target, my_clf_test_predicted_quantized)

    # TODO - it is necessary for the data to be normalised here
    # TODO - add an option to change the input data to some number of bits so that is can also be compared with full resolution

    # check if own classifier works the same as scikit one
    compare_with_own_classifier(
        [test_predicted, my_clf_test_predicted, test_predicted_quantized, my_clf_test_predicted_quantized],
        ["scikit", "scikit_with_input_quantized", "own_clf", "own_clf_with_input_quantized"],
        test_target, flag_save_details_to_file=True
    )

    # optionally check the performance of the scikit classifier for reference (does not work for own classifier)
    test_classification_performance(clf, test_data, 10)


# TODO - WIP, chose one version and test it thoroughly
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


def report_classifier(clf, expected, predicted):
    print("Detailed classification report:")

    print("Classification report for classifier %s:\n%s\n"
          % (clf, metrics.classification_report(expected, predicted)))
    print("Confusion matrix:\n%s" % metrics.confusion_matrix(expected, predicted))

    correct_classifications = 0
    incorrect_classifications = 0
    for e, p in zip(expected, predicted):
        if e == p:
            correct_classifications += 1
        else:
            incorrect_classifications += 1
    print("Accuracy overall: " +
          '% 2.4f' % (correct_classifications / (correct_classifications + incorrect_classifications))
          )


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

    for result, target in zip(results, test_target):
        flag_iteration_error = False

        for i in range(0, len(results)):
            if result[i] != target:
                number_of_errors[i] += 1
                flag_no_errors = False
                flag_iteration_error = True

        if flag_iteration_error and flag_save_details_to_file:
            print("Difference between versions!", file=comparision_file)
            print("Ground true: " + str(target), file=comparision_file)
            for i in range(0, len(results)):
                print(f"{results_names[i]}: {result[i]}", file=comparision_file)

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


# TODO(MF): check parafit module for parameters search
# https://medium.com/mlreview/parfit-hyper-parameter-optimization-77253e7e175e

# this should use the whole data available to find best parameters. So pass both train and test data, find parameters
# and then retrain with found parameters on train data
def grid_search(data: np.ndarray, target: np.ndarray, clf_type: ClassifierType):
    # perform grid search to find best parameters
    scores = ['f1_weighted']
    # alternatives: http://scikit-learn.org/stable/modules/model_evaluation.html#common-cases-predefined-values

    # TODO - min_samples_split could be a float (0.0-1.0) to tell the percentage - test it!

    # general observations:
    # for random_forest increasing the min_samples_split decreases performance, checking values above 20 is not useful
    # in general best results are obtained using min_samples_split=2 (default)

    if clf_type == ClassifierType.decision_tree:
        tuned_parameters = [{'max_depth': [5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100, None],
                             'splitter': ["best", "random"],
                             'min_samples_split': [2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]
                             #'min_samples_split': [0.001, 0.002, 0.003, 0.004, 0.005, 0.01, 0.02, 0.05]
                             }]
    elif clf_type == ClassifierType.random_forest:
        tuned_parameters = [{'max_depth': [5, 10, 20, 35, 50, 70, 100, None],
                             'n_estimators': [5, 10, 20, 35, 50, 70, 100],
                             'min_samples_split': [2, 3, 4, 5, 10]#, 20]
                             #'min_samples_split': [2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20, 30, 40, 50, 75, 100]
                             }]

    else:
        raise ValueError("Unknown classifier type specified")

    for score in scores:
        print("# Tuning hyper-parameters for %s" % score)
        print()

        if clf_type == ClassifierType.decision_tree:
            clf = GridSearchCV(DecisionTreeClassifier(), tuned_parameters, cv=5, scoring='%s' % score, n_jobs=-1)
        elif clf_type == ClassifierType.random_forest:
            clf = GridSearchCV(RandomForestClassifier(), tuned_parameters, cv=5, scoring='%s' % score, n_jobs=-1)
        else:
            raise ValueError("Unknown classifier type specified")

        clf = clf.fit(data, target)

        print("Best parameters set found on development set:")
        print(clf.best_params_)
        print()
        print("Grid scores on development set:")
        for mean, std, params in zip(
                clf.cv_results_['mean_test_score'],
                clf.cv_results_['std_test_score'],
                clf.cv_results_['params']
        ):
            print("%0.3f (+/-%0.03f) for %r"
                  % (mean, std * 2, params))
        print()
