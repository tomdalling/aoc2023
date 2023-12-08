(defun enum-compact (lst)
  (remove nil lst))

(defun enum-first (lst)
  (car lst))

(defun enum-last (lst)
  (car (last lst)))

(defun enum-join (lst)
  (with-output-to-string (output-stream)
    (loop for e in lst
          do (princ e output-stream))))
