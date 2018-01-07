(define (divides? a b) (= (remainder b a) 0))
(define (square a) (* a a))
(define (find-divisor n test-divisor) (cond ((> (square test-divisor) n) n)
                                            ((divides? test-divisor n) test-divisor)
                                            (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n) (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time) 
  (if (prime? n) (report-prime (- (runtime) start-time)))) 

(define (timed-prime-test n) (newline)
  (start-prime-test n (runtime)))

