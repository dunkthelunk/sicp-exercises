(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter a (square b) (/ n 2)))
        (else (fast-expt-iter (* a b) (square b) (/ (- n 1) 2)))))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

