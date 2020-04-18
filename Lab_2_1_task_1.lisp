;gnu clisp 2.49

;Вставка по индекусу (начиная с 0)
(defun insert-by-pos (pos lst el)
    (let ((fst  (subseq lst 0 pos))
          (scnd (subseq lst pos)))
        (push el scnd)
        (concatenate 'list fst scnd)))

;Удаление по индекусу (начиная с 0)
(defun delete-by-pos (pos lst)
    (let ((fst  (subseq lst 0 pos))
          (scnd (subseq lst (+ pos 1))))
        (concatenate 'list fst scnd)))

;Нахождение индекса по значению рекурсивно
(defun recurs-find-by-val (val lst num)
    (when lst (if (= val (car lst) ) (+ num 0) (recurs-find-by-val val (cdr lst) (+ num 1)))))

;Нахождение индекса по значению (вызово рекурсии)
(defun find-by-val (val lst)  
      (recurs-find-by-val val lst 0)) 

(setq  L (list 12 3 7 8 11 9 2))

(loop for i from 0 to 6  
     do (format t "~D," (nth i L))     
     finally (format t "..~%"))

(format t "~D ~%" (find-by-val 2 L)) 


(setq L2 (insert-by-pos 2 L 7))

(loop for i from 0 to 7  
     do (format t "~D," (nth i L2))     
     finally (format t "..~%"))



(setq L3 (delete-by-pos 4 L2))

(loop for i from 0 to 6  
     do (format t "~D," (nth i L3))     
     finally (format t "..~%"))
