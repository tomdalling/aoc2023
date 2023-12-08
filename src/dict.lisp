(defun dict-make (&rest args)
  (apply #'list args))

; cons cell is a pair
; car gives the first
; cdr gives the second (rest)

(defun dict-keys (dict)
  (loop for key in dict
        by #'cddr ; cddr = (cdr (cdr x))
        collect key))

(defun dict-get (key dict)
  (loop for (k v) on dict
        by #'cddr
        when (string= key k)
        return (values v t)
        finally (return (values nil nil))))

(defun dict-key-p (key dict)
  (nth-value 1 (dict-get key dict)))
