; sets as unordered lists
; list of elements in which no element appears more than once


(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set) set (cons x set)))

(define nil '())

; recursive
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) nil)
    ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2))) 
    (else (intersection-set (cdr set1) set2))))

;iterative
(define (intersection-set set1 set2)
  (define (intersec-iter acc set1 set2)
    (if (or (null? set1) (null? set2)) 
      acc
      (intersec-iter (if (element-of-set? (car set1) set2) (cons (car set1) acc) acc) (cdr set1) set2)))
  (intersec-iter nil set1 set2))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (cdr set1) (adjoin-set (car set1) set2)))))

; sets as ordered lists
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
    nil
    (let ((x1 (car set1)) (x2 (car set2)))
      (cond ((< x1 x2) (intersection-set (cdr set1) set2))
            ((= x1 x2) (cons x1 (intersection-set (cdr set1) (cdr set2))))
            (else (intersection-set set1 (cdr set2)))))))
; 2.61
(define (adjoin-set x set)
  (if (null? set) 
    (cons x nil)
    (let ((x1 (car set)))
      (cond ((< x x1) (cons x set))
            ((= x x1) set)
            (else (cons x1 (adjoin-set x (cdr set))))))))
; 2.62
(define (union-set set1 set2)
  (define (uset-iter seta setb acc)
    (cond ((null? seta) (append acc setb))
          ((null? setb) (append acc seta))
          (let ((x1 (car seta)) (x2 (car setb)))
            (cond ((< x1 x2) (uset-iter (cdr seta) setb (append acc x1)))
                  ((= x1 x2) (uset-iter (cdr seta) (cdr setb) (append acc x1)))
                  (else (uset-iter seta (cdr setb) (append acc x2)))))))
  (uset-iter set1 set2 nil))

