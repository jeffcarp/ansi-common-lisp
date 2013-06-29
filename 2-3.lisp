; 2-3
; Using car and cdr, define a function to return the fourth element of a list.

(defun my-fourth (lst)
  (car (cdr (cdr (cdr lst)))))

(format t "~A~%" (my-fourth (list 1 2 3 4 5 6)))

