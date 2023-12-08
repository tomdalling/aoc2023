; Dependencies

(load "quicklisp/setup")
(ql:quickload "str" :silent t)
(ql:quickload "arrow-macros" :silent t)
(ql:quickload "serapeum" :silent t)
(use-package 'arrow-macros)
(import 'serapeum:dict)

; Common stuff

(defun pp (x)
  (format t "~&~S~&" x)
  x)

(defun chars (s)
  (map 'list #'identity s))

(defun dict-keys (d)
  (loop for k being the hash-key of d
        collect k))

(defun llast (lst)
  (car (last lst)))

(defun lfirst (lst)
  (car lst))

(defun sort-by (fn lst)
  (sort lst 
        (lambda (left right) 
            (< (funcall fn left) (funcall fn right)))))

