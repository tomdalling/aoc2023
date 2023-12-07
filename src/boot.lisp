; Dependencies

(load "quicklisp/setup")
(ql:quickload "str" :silent t)
(ql:quickload "arrow-macros" :silent t)
(use-package 'arrow-macros)

; Common stuff

(defun pp (x)
  (format t "~&~S~&" x))

(defun read-lines (path)
  (with-open-file (stream path)
    (loop for line = (read-line stream nil)
          while line
          collect line)))
