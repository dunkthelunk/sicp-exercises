(define (prod f a next b)
  (if (> a b) 1 (* (f a) (prod f (next a) next b))))
