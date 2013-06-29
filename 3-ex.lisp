#!/usr/local/bin/sbcl --script 

(defun proper-list? (x)
  (or (null x)
    (and (consp x)
         (proper-list? (cdr x)))))

(defun is-palindrome? (str)
  (replace str " " "") ; remove spaces
  (let ((len (length str)))
    (if (< len 2)
      nil
      (if (equal (char str 0) (char str (- len 1)))
        (is-palindrome? (subseq str 1 (- len 2)))
        nil))))

(if (is-palindrome? "racecar")
  (write-line "yes")
  (write-line "no"))


