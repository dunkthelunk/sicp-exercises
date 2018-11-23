# Abstractions with Data

## Pairs
  which can be constructed with primitive procedure «cons»
  (define x (cons 23 3))
  (car x)
  (cdr x)

(define (print-rat x) 
  (newline)
  (display (numer x)) 
  (display "/")
  (display (denom x)))

## Data
  is a set of selectors and constructors, together with specified conditions that these procedures must fulfill in order to be a valid representation
  
  (define (cons x y) 
    (define (dispatch m)
      (cond ((= m 0) x) ((= m 1) y)
      (else (error "Argument not 0 or 1: CONS" m)))) dispatch)
  
  (define (car z) (z 0)) 
  (define (cdr z) (z 1))

  (define (cons x y) (lambda (m) (m x y)))
  (define (car z)
    (z (lambda (p q) p)))

## List
  is sequence of pairs formed by nested conses
  (list ⟨a1⟩ ⟨a2⟩ . . . ⟨an⟩) is equiv 
  (cons ⟨a1⟩
    (cons ⟨a2⟩
      (cons . . .
            (cons ⟨an⟩
                  nil). . .)))
### Dotted-tail notation
    of function arguments. list, +, * take arb num of args
    (define (f x y . z) ⟨body⟩) 
    (f 1 2 3 4) then x = 1, y = 2 and z = (list 3 4)

    (define (g . w) ⟨body⟩)
      the procedure g can be called with zero or more arguments.
      f and g using lambda
      (define f (lambda (x y . z) ⟨body⟩))
      (define g (lambda w ⟨body⟩)) notice no braces around w
## map
  apply some transformation to each element in a list and return the new list
  
  (define (map f items)
          (if (null? items) 
              nil 
              (cons (f (car items)) (map f (cdr items)))))
  (define (square-list items)
          (map (lambda (x) (* x x)) items))
 Scheme standardly provides a more general map procedure. 
 This more general map takes a procedure of n arguments, together with n lists,
 and applies the procedure to all the first elements of the lists, 
 all the second elements of the lists, and so on, returning a list of the results.
 (map (lambda (x y) (+ x (\* 2 y)))
          (list 1 2 3)
          (list 4 5 6)) 
    (9 12 15)

## Heirarchical structures
(define x (cons (list 1 2) (list 3 4)))
(length x)
3
(count-leaves x)
4

(define (count-leaves li)
        (cond ((null? li) 0)
              ((not (pair? li)) 1)
              (else (+ (count-leaves (car li)) (count-leaves (cdr li))))))

## Sequence Operations
using accumulate, filter, and map as glue

(define (accumulate op initial sequence) 
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence) (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
(filter predicate (cdr sequence)))) (else (filter predicate (cdr sequence)))))

Map as accumulation
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))
  ; notice how the combiner func is defined; x is new elem, y is accumulated

## Fold
  -right, -left
  Accumulation defined above is fold-right
  fold-right: combine elements in reverse order
  fold-left: combine elements in correct order
(define (fold-left op initial sequence) 
  (define (iter result rest)
    (if (null? rest) result
        (iter (op result (car rest)) ; unlike fold-right 
              (cdr rest))))
  (iter initial sequence))

## Other topics
  permutations
  sequential operations using filter, map/flatmap, accumulate
  backtracking
