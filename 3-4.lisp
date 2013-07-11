; Why does (member '(a) '((a) (b))) return nil?
; 
; Because member uses eql, which compares object equality, not value equality.
