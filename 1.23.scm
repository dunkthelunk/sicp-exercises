(define (square n)
  (* n n))

(define (divides? b a)
  (= (remainder a b) 0))

(define (next div)
  (if (= div 2) 3 (+ div 2)))

(define (find-divisor n current-divisor)
  (cond ((> (square current-divisor) n) n)
        ((divides? current-divisor n) current-divisor)
        (else (find-divisor n (next current-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))
