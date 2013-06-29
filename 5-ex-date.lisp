(defconstant month
  #(0 31 59 90 120 151 181 212 243 273 304 334 365))

(defconstant yzero 2000)

(defun leap? (y)
  (and (zerop (mod y 4))
    (or (zerop (mod y 400))
        (not (zerop (mod y 100))))))

(defun date->num (d m y)
  (+ (- d 1) (month-num m y) (year-num y)))

(defun month-num (m y)
  (+ (svref month (- m 1))
     (if (and (> m 2) (leap? y)) 1 0)))

(defun year-num (y)
  (let ((d 0))
    (if (>= y yzero)
      (dotimes (i (- y yzero) d)
        (incf d (year-days (+ yzero i))))
      (dotimes (i (- yzero y) (- d))
        (incf d (year-days (+ y i )))))))

(defun year-days (y) (if (leap? y) 366 365))

; (format t "~A" (date->num 6 2 2002))
; (format t "~A" (year-num 1902))
; (write-line "yes")

(defun num->date (n)
  (multiple-value-bind (y left) (num-year n)
    (multiple-value-bind (m d) (num-month left y)
      (values d m y))))

(defun num-year (n)
  (if (< n 0)
      (do* ((y (- yzero 1) (- y 1))
            (d (- (year-days y)) (- d (year-days y))))
           ((<= d n) (values y (- n d))))
      (do* ((y yzero (+ y 1))
            (prev 0 d)
            (d (year-days y) (+ d (year-days y))))
           ((> d n) (values y (- n prev))))))

(defun num-month (n y)
 (if (leap? y)
     (cond ((= n 59) (values 2 29))
           ((> n 59) (nmon (- n 1)))
           (t        (nmon n)))
     (nmon n)))

(defun nmon (n)
  (let ((m (position n month :test #'<)))
    (values m (+ 1 (- n (svref month (- m 1)))))))

(defun date+ (d m y n)
  (num->date (+ (date->num d m y) n)))


;(do ((i 0 (+ i 1)))
  ;(multiple-value-bind (d m y) (num->date i)
  ;  (format t "~A ~A ~A ~%" d m y))
;  (format t "wut")
;  ((> i 10) t)) 

(do* ((i 0 (+ i 1))
  (write-line (format t "wtf ~A ~%" i)))
  ((= i 0) (write-line "done")))
