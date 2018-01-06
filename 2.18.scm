(define (reverse-list items)
  (define (reverse-list-iter src dest)
    (if (null? src) dest (reverse-list-iter (cdr src) (cons (car src) dest))))
  (reverse-list-iter (cdr src) (list (car src))))
