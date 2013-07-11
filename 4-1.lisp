; Define a function to take a square array (an array whose dimensions are (n n)) and rotate it 90 degrees clockwise:
;
; > (quarter-turn #2A((a b) (c d)))
; #2A((C A) (D B))

; hint: you'll need array-dimensions (p.361)
; assuming no need for error checking (esp. wrt dimensions)

(defun quarter-turn (arr)
  (let ((newarr (make-array (array-dimensions arr)))
        (n (car (array-dimensions arr))))
    (do ((i n (1- i)))
        ((= i 0))
      (do ((j 0 (1+ j)))
          ((= j n))
        (setf (aref newarr j (- n i)) (aref arr (1- i) j))))
    newarr))

(let ((arr #2A((a b) (c d))))
  (format t "result: ~A ~%" (quarter-turn arr)))

(let ((arr #2A((a b c) (d e f) (g h i))))
  (format t "result: ~A ~%" (quarter-turn arr)))
