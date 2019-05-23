(in-package #:circleci-101)

(defvar *handler* nil)

(defun handle-request (env)
  (declare (ignorable env))
  '(200 (:content-type "text/plain") ("Hello, World!")))

(defun start (&key (port 80))
  (unless *handler*
    (setf *handler* (clack:clackup #'handle-request :port port))))

(defun stop ()
  (when *handler*
    (clack:stop *handler*)
    (setf *handler* nil)))
