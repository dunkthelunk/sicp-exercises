(define (even? n) (= (remainder n 2) 0))
(define (halve n) (/ n 2))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated-app f n)
  (cond ((= n 0) (lambda (x) x))
        ((even? n) (repeated-app (compose f f) (halve n)))
        (else (compose f (repeated-app f (- n 1))))))

((repeated-app square 2) 5)

