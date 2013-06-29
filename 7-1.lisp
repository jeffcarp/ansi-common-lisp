; 1. Define a function that takes a filename and returns a list of strings 
; representing each line in the file.

(defun file-string-list (filename)
  (with-open-file (str filename :direction :input)
    (let ((string-list ()))
      (do ((line (read-line str nil 'eof)
                 (read-line str nil 'eof)))
          ((eql line 'eof))
        (format t "~S~%" line)
        (setf string-list (append string-list (list line))))
      string-list)))

(format t "~S~%" (file-string-list "test.md"))

