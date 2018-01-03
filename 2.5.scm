(define (cons1 a b)
  (* (pow 2 a) (pow 3 b)))

(define (car1 z)
  (car-cdr-iter z 0 (lambda (n) (= (remainder n 2) 0)) (lambda (n) (/ n 2))))

(define (cdr1 z)
  (car-cdr-iter z 0 (lambda (n) (= (remainder n 3) 0)) (lambda (n) (/ n 3))))

(define (car-cdr-iter num count ifcond? nextterm)
  (if (ifcond? num)
    (car-cdr-iter (nextterm num) (+ count 1) ifcond? nextterm)
    (count)))
