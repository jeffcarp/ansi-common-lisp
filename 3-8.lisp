; 3-8
; Define a function that takes a list and prints it in dot notation:
;
; > (showdots '(a b c))
; (A . (B . (C . NIL)))
; NIL

(defun showdots (lst)
  (if (null lst)
    (format nil "NIL")
    (format nil "(~A . ~A)" (car lst) (showdots (cdr lst)))))

(format t "~A~%" (showdots '(a b c)))
