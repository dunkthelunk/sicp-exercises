(define (divides? a b) (= (remainder b a) 0))
(define (square a) (* a a))
(define (find-divisor n test-divisor) (cond ((> (square test-divisor) n) n)
                                            ((divides? test-divisor n) test-divisor)
                                            (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime prime elapsed-time)
  (display prime)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (start-prime-test n start-time) 
  (if (prime? n) (report-prime n (- (runtime) start-time)))) 

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (next-odd n)
  (if (= (remainder n 2) 0) (+ n 1) (+ n 2)))

(define (primes-in-range start end)
    (timed-prime-test start)
    (if (< (next-odd start) end) (primes-in-range (next-odd start) end)))


