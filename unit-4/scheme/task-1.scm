; Task 1.1
(define (force x)
  (if (null? x) '() ((car x))))
(define (delay e) (lambda () e))
(define the-empty-stream '())
(define-syntax cons-stream
  (syntax-rules ()
    ((cons-stream x y)
      (cons x (delay y)))))
(define head car)
(define (tail s) (force (cdr s)))
(define empty-stream? null?)

(define (fib-stream-increment x y i)
  (let ((next (max (+ x y) 1)))
    (cons-stream (list i y) (fib-stream-increment y next (+ i 1)))))

(define (fib-stream) (fib-stream-increment 0 0 0))

; (define a (fib-stream))

; (tail a)
; (tail (tail a))
; (tail (tail (tail a)))
; (tail (tail (tail (tail a))))
; (tail (tail (tail (tail (tail a)))))
; (tail (tail (tail (tail (tail (tail a))))))
; (tail (tail (tail (tail (tail (tail (tail a)))))))
; (tail (tail (tail (tail (tail (tail (tail (tail a))))))))
; (tail (tail (tail (tail (tail (tail (tail (tail (tail a)))))))))

; (define (has-even-fib)
  ; )

(define (filter p s)
  (if (empty-stream? s)
      the-empty-stream
      (let ((x (head s)))
        (if (p x)
          (cons-stream x (filter p (tail s)))
          (filter p (tail s))))))

; (define b (list 1 (lambda () (list 2 (lambda () (list 3))))))

(define (is-even-fib? item) (= (modulo (car (cdr item)) 2) 0))
(define (has-even-fib) (map car (filter is-even-fib? (fib-stream))))