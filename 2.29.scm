(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

; a)
(define (left-branch mobile)
	(car mobile))
(define (right-branch mobile)
	(cadr mobile))
(define (branch-length branch)
	(car branch))
(define (branch-structure branch)
	(cadr branch))

; b)
(define (branch-weight branch)
	(let ((branchstruct (branch-structure branch)))
		(if (pair? branchstruct) (total-weight branchstruct) branchstruct)))

(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile)) (branch-weight (right-branch mobile))))

; c)
(define (branch-is-mobile? branch)
  (pair? (branch-structure branch)))

(define (branch-weight-if-balanced branch)
  (if (not (branch-is-mobile? branch)) 
    (branch-structure branch)
    (if (and leftwtifbal rightwtifbal (= lefttorque righttorque)) (+ leftwtifbal rightwtifbal) #f)))   

(define (balanced-mobile? mobile)
  (let (
        (left-weight-if-bal (branch-weight-if-balanced (left-branch mobile)))
        (right-weight-if-bal (branch-weight-if-balanced (right-branch mobile)))
        ((left-torque weight) (* weight (branch-length (left-branch mobile)))) 
        ((right-torque weight) (* weight (branch-length (right-branch mobile)))) 
        )
    (if (and left-weight-if-bal right-weight-if-bal) (= (left-torque left-weight-if-bal) (right-torque right-weight-if-bal)) #f)))
