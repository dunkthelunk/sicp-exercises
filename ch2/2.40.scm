(define nil '())

(define (enumerate-interval start end)
  (if (> start end) 
      nil
      (cons start (enumerate-interval (+ start 1) end))))

(define (flatmap proc seq)
  (fold-right append nil (map proc seq)))

(define (unique-pairs n) 
  (flatmap (lambda (i) 
             (map (lambda (j) (list i j)) (enumerate-interval 1 (- i 1)))) (enumerate-interval 2 n)))

(define (prime-sum-pairs n)
  (map (lambda (pair) (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
       (filter prime-sum? (unique-pairs n))))
