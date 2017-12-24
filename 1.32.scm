; 1.32.a
(define (accumulate combiner null-value term a next b)
  (if (> a b) null-value ((combiner (term a) (accumulate combiner null-value term (next a) next b)))))

; 1.32.b
(define (accumulate combiner null-value term a next b)
  (define (accumulate-it a acc)
    (if (> a b) acc (accumulate-it (next a) (combiner (term a) acc))))
  (accumulate-it a null-value))

(define (sum f a next b)
  (accumulate + 0 f a next b))

(define (product f a next b)
  (accumulate * 1 f a next b))
