(define (cons1 a b)
  (* (pow 2 a) (pow 3 b)))

(define (car1 z)
  (car-cdr-iter z 0 2))

(define (cdr1 z)
  (car-cdr-iter z 0 3))

(define (car-cdr-iter num count divisor)
  (if (= (remainder num divisor) 0)
    (car-cdr-iter (/ num divisor) (+ count 1) divisor)
    count))
