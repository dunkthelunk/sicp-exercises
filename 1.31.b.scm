(define (prod f a next b)
  (define (prod-it a product)
    (if (> a b) product (prod-it (next a) (* (f a) product))))
  (prod-it a 1))
