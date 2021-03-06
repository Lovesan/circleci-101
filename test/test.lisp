(in-package #:cl-user)

(uiop:define-package #:circleci-101-test
  (:use #:cl #:circleci-101 #:fiveam)
  (:export #:circleci-101-suite))

(in-package #:circleci-101-test)

(defparameter *run-integration-tests* (let ((env (uiop:getenv "RUN_INTEGRATION_TESTS")))
                                        (and env t)))

(def-suite circleci-101-suite
  :description "Tests")

(in-suite circleci-101-suite)

(test test-hello
  (is (eq t t)))

(test test-integration
  (if *run-integration-tests*
    (is (eq t t))
    (skip "Not an integration test")))