(defun calibration-value (line)
  (->>
    (map 'list #'identity line)
    (remove-if-not #'digit-char-p)
    (first-and-last)
    (join)
    (parse-integer)))

(defun first-and-last (lst)
  (list (car lst) (car (last lst))))

(defun join (lst)
  (format nil "~{~A~^~}" lst))

(->>
  (read-lines "src/day1.txt")
  (mapcar #'calibration-value)
  (reduce '+)
  (pp))
