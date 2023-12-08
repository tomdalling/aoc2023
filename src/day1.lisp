
(defconstant words 
  (dict "one" "1"
        "two" "2"
        "three" "3"
        "four" "4"
        "five" "5"
        "six" "6"
        "seven" "7"
        "eight" "8"
        "nine" "9"))

(defun calibration-value (line)
  (->> line
    (pp)
    (words-to-digits)
    (map 'list #'identity)
    (remove-if-not #'digit-char-p)
    (first-and-last)
    (join)
    (parse-integer)
    (pp)))

(defun first-word-in (line)
  (->> words
    (dict-keys)
    (mapcar #'(lambda (word) (list word (search word line))))
    (remove-if-not #'llast)
    (sort-by #'llast)
    (lfirst)
    (lfirst)))

(defun words-to-digits (line)
  (let ((w (first-word-in line)))
    (if w
      (words-to-digits ; replace first and recurse
        (str:replace-first w (gethash w words) line))
      line))) ; nothing found, so done

(defun first-and-last (lst)
  (list (lfirst lst) (llast lst)))

(defun join (lst)
  (format nil "~{~A~^~}" lst))

(->> "src/day1.txt"
  (str:from-file)
  (str:lines)
  (mapcar #'calibration-value)
  (pp)
  (reduce '+)
  (pp))
