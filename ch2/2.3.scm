; assuming rectangle sides are parallel to axes
; define rect using lower left corner, top right corner
(define (make-rect p1 p2)
  (cons p1 p2))

(define (rect-length-x rect)
  (- (x-point (cdr rect)) (x-point (car rect))))

(define (rect-length-y rect)
  (- (y-point (cdr rect)) (y-point (car rect))))

; define rect - (lowerleftcorner, lenght-x, length-y)
(define (make-rect llcorner xlength ylength)
  (cons llcorner (cons xlength ylength)))
; return length and breadth

; area, perimieter using lenght and breadth

