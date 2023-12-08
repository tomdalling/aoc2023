(defun digit-at (idx line)
  (let ((first-char (str-char-at idx line)))
    (if (digit-char-p first-char)
      first-char
      (loop for digit from 1 upto 9
            for word = (word-for-digit digit)
            for substr = (str-substr idx nil line)
            when (str-starts-with-p word substr)
            return (char-for-digit digit)))))

(defun char-for-digit (digit)
  (code-char (+ digit (char-code #\0))))

(defun word-for-digit (digit)
  (format nil "~R" digit))

(defun digits-in (line)
  (enum-compact
    (loop for idx below (length line)
          collect (digit-at idx line))))

(defun calibration-value (line)
  (->> line
       (digits-in)
       (first-and-last)
       (enum-join)
       (parse-integer)))

(defun first-and-last (lst)
  (list (enum-first lst) (enum-last lst)))

(->> "src/day1.txt"
  (file-read)
  (str-lines)
  (remove-if #'str-empty-p)
  (mapcar #'calibration-value)
  (reduce '+)
  (pp))
