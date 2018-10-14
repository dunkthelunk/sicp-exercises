(define (cons1 a b)
  (lambda (m) (m a b)))

(define (car1 z)
  (z (lambda (p q) p)))

(define (cdr1 z)
  (z (lambda (p q) q)))
