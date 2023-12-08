(defun parse-game (line)
  (let* ((split (str-split ": " line))
         (game-id (->> split
                       (first)
                       (str-delete-prefix "Game ")
                       (parse-integer)))
         (reveals (parse-reveals (enum-last split))))
    (dict-make :id game-id
               :reveals reveals)))

(defun parse-reveals (reveals-str)
  (->> reveals-str
    (str-split "; ")
    (mapcar #'parse-reveal)))

(defun parse-reveal (reveal-str)
  (->> reveal-str
    (str-split ", ")
    (mapcar #'parse-reveal-color)))

(defun parse-reveal-color (reveal-color-str)
  (let* ((split (str-split " " reveal-color-str))
         (color (enum-last split))
         (count (parse-integer (enum-first split))))
    (dict-make color count)))

(->> "data/day2-example.txt"
     (file-read)
     (str-lines)
     (remove-if #'str-empty-p)
     (mapcar #'parse-game)
     (pp))
