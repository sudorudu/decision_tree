import numpy as np

from sklearn.tree import DecisionTreeClassifier
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GridSearchCV
from sklearn import metrics

from tree import Tree
from tree import RandomForest

import time

from enum import Enum


class ClassifierType(Enum):
    decision_tree = 1
    random_forest = 2


def test_dataset(number_of_bits_per_feature: int,
                 train_data: np.ndarray, train_target: np.ndarray,
                 test_data: np.ndarray, test_target: np.ndarray,
                 clf_type: ClassifierType
                 ):
    number_of_features = len(train_data[0])

    # TODO - insert grid_search function to first find the best parameters
    # TODO cont. - alternatively run gridsearch as a separate function so this is is fast

    # first create classifier from scikit
    if clf_type == ClassifierType.decision_tree:
        clf = DecisionTreeClassifier()
    elif clf_type == ClassifierType.random_forest:
        clf = RandomForestClassifier()
    else:
        raise ValueError("Unknown classifier type specified")

    # TODO - it is necessary to add normalisation step here. otherwise the input is not in 0-1 range
    # TODO cont. - thus not taking into account bit per feature (which works only for fractions)
    # TODO dataset_tester.normalise_data
    # TODO - add option to change the input data to some number of bits so that is can also be compared with full resolution
    # use normalise_data function

    # train classifier and run it on test data, report the results
    clf.fit(train_data, train_target)
    test_predicted = clf.predict(test_data)

    print("Detailed classification report:")
    print("The model is trained on the full development set.")
    print("The scores are computed on the full evaluation set.")
    report_classifier(clf, test_target, test_predicted)

    # generate own classifier based on the one from scikit
    my_clf = generate_my_classifier(clf, number_of_features, number_of_bits_per_feature)

    # check if own classifier works the same as scikit one
    compare_with_own_classifier(clf, my_clf, test_data)

    # optionally check the performance of the scikit classifier for reference (does not work for own classifier)
    test_classification_performance(clf, test_data, 10)


# TODO - WIP, chose one version and test it thoroughly
def normalise_data(train_data: np.ndarray, test_data: np.ndarray):
    from sklearn import preprocessing

    print("np.max(train_data): " + str(np.max(train_data)))
    print("np.ptp(train_data): " + str(np.ptp(train_data)))

    normalised_1 = 1 - (train_data - np.max(train_data)) / -np.ptp(train_data)
    normalised_2 = preprocessing.minmax_scale(train_data)

    train_data /= 16
    test_data /= 16

    print("Are arrays equal: " + str(np.array_equal(normalised_2, train_data)))
    print("Are arrays equal: " + str(np.array_equal(normalised_1, train_data)))

    for i in range(0, 1):
        print(train_data[i])
        print(normalised_1)
        print(normalised_2)


def report_classifier(clf, expected, predicted):
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


def compare_with_own_classifier(scikit_clf, own_clf, test_data):
    flag_no_errors = True
    number_of_errors = 0
    for sample in test_data:
        scikit_result = scikit_clf.predict([sample])
        my_result = own_clf.predict(sample)

        if scikit_result != my_result:
            print("Error!")
            print(scikit_result)
            print(my_result)
            number_of_errors += 1
            flag_no_errors = False

    if flag_no_errors:
        print("All results were the same")
    else:
        print("Number of errors: " + str(number_of_errors))


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


# TODO - WIP, almost done
# TODO - should this use both train and test data or not?
def grid_search(train_data: np.ndarray, train_target: np.ndarray, clf_type: ClassifierType):
    # perform grid search to find best parameters
    # TODO - think about which metric would be best
    scores = ['f1']#''precision', 'recall']
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
            clf = GridSearchCV(DecisionTreeClassifier(), tuned_parameters, cv=5, scoring='%s_macro' % score, n_jobs=-1)
        elif clf_type == ClassifierType.random_forest:
            clf = GridSearchCV(RandomForestClassifier(), tuned_parameters, cv=5, scoring='%s_macro' % score, n_jobs=-1)
        else:
            raise ValueError("Unknown classifier type specified")

        clf = clf.fit(train_data, train_target)

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
