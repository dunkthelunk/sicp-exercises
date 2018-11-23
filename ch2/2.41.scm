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

(define (minus-sum-equals-k? s)
    (lambda (pair) 
      (let ((k (- s (+ (car pair) (cadr pair))))) 
        (and (<= 1 k) (> (cadr pair) k)))))

(define (triplet-sum-equals s n)
  (map (lambda (pair) (list (car pair) (cadr pair) (- s (+ (car pair) (cadr pair))))) (filter (minus-sum-equals-k? s) (unique-pairs n)))) 
