(define (square x) (* x x))
(define (min x y) (if (< x y) x y)) 
(define (sum-of-squares-of-larger-two x y z)
        (- (+ (square x) (square y) (square z)) (square (min (min x y) z)))) 
