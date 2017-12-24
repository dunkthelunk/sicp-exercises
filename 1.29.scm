(define (even? n)
  (= (remainder n 2) 0))

(define (cube x) (* x x x))

(define (add-one k) (+ k 1))

(define (sum term a next b)
  (if (> a b) 0 (+ (term a) (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (term-multiplier k)
    (* (/ h 3) (if (even? k) (if (or (= k 0) (= k n)) 1 2) 4)))
  (define (term k)
    (* (term-multiplier k) (f (+ a (* k h)))))
  (sum term 0 add-one n))  
