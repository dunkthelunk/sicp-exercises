(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1) t))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ (length x) y)) 0 (map enumerate-tree t)))
