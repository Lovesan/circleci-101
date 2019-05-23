(in-package #:cl-user)

(uiop:define-package #:circleci-101-test
  (:use #:cl #:circleci-101 #:fiveam)
  (:export #:circleci-101-suite))

(in-package #:circleci-101-test)

(defvar *run-integration-tests* (let ((env (uiop:getenv "RUN_INTEGRATION_TESTS")))
                                  (and env (string-equal env "t"))))

(def-suite circleci-101-suite
  :description "Tests")

(in-suite circleci-101-suite)

(test test-hello
      (is (eq t t)))

(when *run-integration-tests*
    (test test-integration (is (eq t t))))