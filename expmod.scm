(define (expmod base e m)
  (cond ((= e 0) 1)
        ((= (remainder e 2) 0) (remainder (square (expmod base (/ e 2) m)) m))
        (else (remainder (* b (expmod base (- e 1) m)) m)))) 
