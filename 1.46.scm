(define (iterative-improve good-enough? improve-guess)
  (lambda (guess) (if (good-enough? guess) guess ((iterative-improve good-enough? improve-guess) (improve-guess guess)))))
