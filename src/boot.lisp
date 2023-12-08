; Dependencies

(load "quicklisp/setup")
(ql:quickload "str" :silent t)
(ql:quickload "arrow-macros" :silent t)
(use-package 'arrow-macros)

(load "src/dict")
(load "src/file")
(load "src/str")
(load "src/enum")

; Common stuff

(defun pp (x)
  (format t "~&~S~&" x)
  x)

(defun chars (s)
  (map 'list #'identity s))

(defun llast (lst)
  (car (last lst)))

(defun lfirst (lst)
  (car lst))

(defun sort-by (fn lst)
  (sort lst 
        (lambda (left right) 
            (< (funcall fn left) (funcall fn right)))))

