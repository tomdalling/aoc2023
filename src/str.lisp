(defun str-lines (s)
  (str-split (string #\newline) s))

(defun str-split (separator s)
  (cl-ppcre:split separator s))

(defun str-empty-p (s)
  (zerop (length s)))

(defun str-chars (s)
  (coerce s 'list))

(defun str-char-at (idx s)
  (char s idx))

(defun str-substr (from-idx to-index s)
  (subseq s from-idx (when to-index
                       (1+ to-index))))

(defun str-delete-prefix (prefix s)
  (if (str-starts-with-p prefix s)
    (str-substr (length prefix) nil s)
    s))

(defun str-starts-with-p (prefix s)
  (uiop:string-prefix-p prefix s))
