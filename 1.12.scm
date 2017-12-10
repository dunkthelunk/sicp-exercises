; pascal
(define (pa1 n k)
  (cond ((= k 1) 1)
        ((= k n) 1)
        ((> k n) 0) ; error
        ((< k 1) 0) ; error
        ( else (+ (pa1 (- n 1) k) (pa1 (- n 1) (- k 1)))))
  )
