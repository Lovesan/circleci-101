(ql:quickload :circleci-101)

(defun main ()
  (circleci-101:start)
  (loop (sleep 1)))

(sb-ext:save-lisp-and-die "hello" :executable t :toplevel #'main)
