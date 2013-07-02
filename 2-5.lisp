; What do these functions do?

(defun enigma (x)
  (and (not (null x))       ; x is not nil 
    (or (null (car x))      ; x's car is nil || enigma(cd
      (enigma (cdr x)))))

(defun mystery (x y)
  (if (null y)
    nil
    (if (eql (car y) x)
      0
      (let ((z (mystery x (cdr y))))
        (and z (+ z 1))))))
