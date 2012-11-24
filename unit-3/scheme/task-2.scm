; Task 2.1
(define (ableiten f k)
  (lambda (x)
      (/ (- (f (+ k x)) (f (- x k)))
         (* 2 k))))

; Task 2.2
(define threshold 0.0001)

(define (abs x)
  (if (< x 0) (* x -1) x))

(define (in-treshold a b treshold)
  (<= (abs (- a b)) treshold))

(define (iter-until f previous current threshold)
   (if (in-treshold previous current threshold)
     current
     (iter-until f current (f current) threshold)))

(define (make-nstf f)
  (let ((fd (ableiten f threshold)))
    (let ((fiter (lambda (x) (- x (/
              (f x)
              (fd x))))))
      (lambda (x) (iter-until fiter (fiter x) (fiter (fiter x)) threshold)))))




; (fiter (lambda (x) (- x (/
;               (f x)
;               (fd x))))))
;   (lambda (x) (iter-until fiter (fiter x) (fiter (fiter x)) threshold))))