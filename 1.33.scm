; 1.33.recursive
(define (filtered-accumulate combiner null-value term a next b valid?)
  (if (> a b) null-value (if (valid? a) (combiner (term a) (accumulate combiner null-value term (next a) next b valid?)) (accumulate combiner null-value term (next a) next b valid?))))

; 1.33.iterative
(define (filtered-accumulate combiner null-value term a next b)
  (define (accumulate-it a acc)
    (if (> a b) acc (if (valid? a) (accumulate-it (next a) (combiner (term a) acc)) (accumulate-it (next a) acc))))
  (accumulate-it a null-value))


; 1.33.recursive
(define (filtered-accumulate combiner null-value term a next b valid?)
  (if (> a b) null-value (combiner (if (valid? a) (term a) null-value) (accumulate combiner null-value term (next a) next b valid?))))

; 1.33.iterative
(define (filtered-accumulate combiner null-value term a next b)
  (define (accumulate-it a acc)
    (if (> a b) acc (accumulate-it (next a) (combiner (if (valid? a) (term a) null-value) acc)))) 
  (accumulate-it a null-value))


