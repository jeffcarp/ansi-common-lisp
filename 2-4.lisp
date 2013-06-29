; 2-4
; Define a function that takes two arguments and returns the greater of the two.
; (not sure what to do if they're equal)

(defun greater (x y)
  (if (> x y) x y))

(format t "~A~%" (greater 6 3))
