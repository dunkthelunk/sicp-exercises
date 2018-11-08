## Special forms
  (define x 3)
  (cond ((> x 2) 1)
        ((< x 1) 0)
        (else -1))
  (if (> x 30) 2 3)
  (and (pred1) (pred2))
  (or () ())
  (lambda (x) (+ x 4))
  define and call
  ((lambda (x y) (+ x y)) 1 2)

  (let ((x 1) (y 2) (z 3)) <body>) equivalent to bbelow lambda
  ((lambda (x y z) <body>) 1 2 3)
## higher order functions
  (define (sum term next start end)
    (if (> start end)
        0
        (+ (term start) (sum term next (next start) end))))

  (define (cube-sums start end)
    (define (cube a)
            (* a a a))
    (define (inc a)
            (+ a 1))
    (sum cube next start end))
### accumulate
 * recursive
  (define (accumulate combiner null-value next a f b)
    (if (> a b)
        null-value
        (combiner (f a) (accumulate combiner null-value (next a) f b))))
  * iterative
  (define (accumulate combiner null-value next a f b)
    ((lambda (t acc) 
          ((if (> a b) acc (self (next a) (combiner (f a) acc)) ; call self how?
      a null-value)
