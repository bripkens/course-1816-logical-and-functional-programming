(defn number-comparator [a b]
  (cond
   (< a b) -1
   (> a b) 1
   :else 0))

(defn insert-into [l v f]
  (cond
   (empty? l) (cons v l)
   (< (f v (first l)) 0) (cons v l)
   :else (cons (first l) (insert-into (rest l) v f))))

(defn insertion-sort
  ([list] (insertion-sort list number-comparator []))
  ([list comparator] (insertion-sort list comparator []))
  ([list comparator sorted]
    (if (empty? list)
      sorted
      (insertion-sort (rest list)
                      comparator
                      (insert-into sorted (first list) comparator)))))

(assert (= (insertion-sort '(2 4 1 6 4)) '(1 2 4 4 6)))
(assert (= (insertion-sort '()) '()))
(assert (= (insertion-sort '(3 2 1)) '(1 2 3)))