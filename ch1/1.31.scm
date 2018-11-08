; a)
(define (prod f a next b)
  (if (> a b) 1 (* (f a) (prod f (next a) next b))))

; b)
(define (prod f a next b)
  (define (prod-it a product)
    (if (> a b) product (prod-it (next a) (* (f a) product))))
  (prod-it a 1))
