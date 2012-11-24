; Task 3.1
(define (as-find key list)
  (if (null? list)
    '()
    (let ((entry (car list)))
      (if (eq? (car entry) key)
        (cons (car (cdr entry)) (as-find key (cdr list)))
        (as-find key (cdr list))))))

; Task 3.2
(define (empty-as? al) (null? al))

(define (first-as al)
  (if (empty-as? al) '() (car al)))

(define (rest-as al)
  (if (empty-as? al) '() (cdr al)))

(define (create-dispatcher l)
  (lambda (f arg)
     (cond ((eq? f 'null?) (empty-as? l))
           ((eq? f 'cdr) (create-dispatcher (rest-as l)))
           ((eq? f 'car) (first-as l))
           ((eq? f 'cons) (create-dispatcher (cons arg l)))
           ((eq? f 'find) (as-find arg l))
           (else (error "Message not recognised")))))

(define (make-empty-as) (create-dispatcher '()))

; Task 3.3
(define (as-show as)
  (if (as 'null? 'dummy)
    '()
    (cons (as 'car 'dummy) (as-show (as 'cdr 'dummy)))))