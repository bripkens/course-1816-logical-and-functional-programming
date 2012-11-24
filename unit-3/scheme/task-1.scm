(define (number-comparator a b)
  (cond
   ((< a b) -1)
   ((> a b) 1)
   (else 0)))

(define (insert-into l v f)
  (cond
   ((null? l) (cons v l))
   ((< (f v (car l)) 0) (cons v l))
   (else (cons (car l) (insert-into (cdr l) v f)))))

(define (insertion-sort l)
  (if (null? l)
    '()
    (insert-into (insertion-sort (cdr l)) (car l) number-comparator)))

;(assert (= (insertion-sort '(2 4 1 6 4)) '(1 2 4 4 6)))
;(assert (= (insertion-sort '()) '()))
;(assert (= (insertion-sort '(3 2 1)) '(1 2 3)))