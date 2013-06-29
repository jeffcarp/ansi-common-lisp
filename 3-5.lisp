; 3-5
; Suppose the function pos+ takes a list and returns a list of each element plus its position:
;
; > (pos+ '(7 5 1 4))
; (7 6 3 7)
;
; Define this function using (a) recursion, (b) iteration, (c) mapchar

; (a) recursion

(defun apos+ (lst)
  (append 
    (if (> (length lst) 1)
      (apos+ (subseq lst 0 (- (length lst) 1))))
    (list (+ (car (last lst)) (- (length lst) 1)))))

(format t "~A~%" (apos+ '(7 5 1 4)))

; (b) iteration

(defun bpos+ (lst)
  (do ((i 0 (+ i 1)))
      ((> i (- (length lst) 1)) lst)
    (setf (nth i lst) (+ i (nth i lst)))))

(format t "~A~%" (bpos+ '(7 5 1 4)))

; (c) mapchar 

(defun cpos+ (lst)
  (let ((i -1))
    (mapcar #'(lambda (x) 
        (setf i (+ i 1))
        (+ x i))
      lst)))

(format t "~A~%" (cpos+ '(7 5 1 4)))
