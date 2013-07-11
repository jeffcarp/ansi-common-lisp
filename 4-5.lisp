; Define bst-adjoin. This function should take the same arguments as bst-insert, but should only insert the object if there is nothing eql to it in the tree.

(defstruct (node (:print-function
                  (lambda (n s d)
                    (format s "#<~A l: ~A r: ~A>" (node-elt n) (node-l n) (node-r n)))))
  elt (l nil) (r nil))

(defun bst-insert (obj bst <)
  (if (null bst)
      (make-node :elt obj)
      (let ((elt (node-elt bst)))
        (if (eql obj elt)
            bst
            (if (funcall < obj elt)
                (make-node
                   :elt elt
                   :l   (bst-insert obj (node-l bst) <)
                   :r   (node-r bst))
                (make-node
                   :elt elt
                   :r   (bst-insert obj (node-r bst) <)
                   :l   (node-l bst)))))))


(let (best)
  (setf best (bst-insert 4 best #'<))
  (setf best (bst-insert 2 best #'<))
  (setf best (bst-insert 3 best #'<))
  (setf best (bst-insert 8 best #'<))
  (setf best (bst-insert 7 best #'<))
  (format t "~A ~%" best))
