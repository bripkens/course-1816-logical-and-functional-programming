(define (min a b) (if (< a b) a b))

(define (square x) (* x x))

(define (pythagoras a b c)
  (define smallest (min a (min b c)))
  (- (+ (square a) (square b) (square c)) (square smallest)))