(define (fringe tree)
  (define (fringe-iter src dest)
    (cond ((null? src) dest)
          ((pair? (car src)) (fringe-iter (cdr src) (fringe-iter (car src) dest)))
          (else (fringe-iter (cdr src) (append dest (list (car src)))))))
  (fringe-iter tree '()))