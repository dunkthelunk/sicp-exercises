(define (same-par num1 num2)
  (even? (+ num1 num2)))

(define (same-parity first . rest)
  (define (same-parity-iter items same-par-items)
    (if (null? items) (reverse same-par-items) (same-parity-iter (cdr items) (if (same-par first (car items)) (cons (car items) same-par-items) same-par-items))))
  (same-parity-iter rest (list first)))
