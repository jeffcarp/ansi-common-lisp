; shortest-path takes a node, a destination node, and a network, and returns the shortest path, if there is one.
; > (setf min '((a b c) (b c) (c d)))
; > (shortest-path 'a 'd min)
; (A C D)
