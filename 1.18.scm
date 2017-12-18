(define (double a) (* a 2))
(define (halve a) ((floor (/ a 2))))

(define (fast-mult a b)
  (define (fast-mult-iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (fast-mult-iter (double a) (halve b) acc))
          (else (fast-mult-iter a (- b 1) (+ acc a)))))
  (fast-mult-iter a b 0))
