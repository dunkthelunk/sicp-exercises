(define (for-each-impl f items)
  (cond ((null? items) #t)
        (else (f (car items)) (for-each-impl f (cdr items))))) 
