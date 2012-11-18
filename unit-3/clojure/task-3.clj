; Task 3.1
(defn as-find [key list]
  (if (empty? list)
    '()
    (let [entry (first list)]
      (if (= (first entry) key)
        (conj (as-find key (rest list)) (first (rest entry)))
        (as-find key (rest list))))))

(as-find 'b '((a 1) (b 7) (c 4) (a 6) (c 5) (d4 ) (b 2)))
(as-find 'a '((a 1) (b 7) (c 4) (a 6) (c 5) (d4 ) (b 2)))
(as-find 'e '((a 1) (b 7) (c 4) (a 6) (c 5) (d4 ) (b 2)))


; Task 3.2
(defn error [msg] (assert false))

(defn empty-as? [al] (= (first al) nil))

(defn first-as [al]
  (if (empty-as? al) '() (first al)))

(defn rest-as [al]
  (if (empty-as? al) '() (rest al)))

(defn create-dispatcher [l]
  (fn
  ([f]
     (cond (= f 'null?) (empty-as? l)
           (= f 'cdr) (create-dispatcher (rest-as l))
           (= f 'car) (first-as l)
           :else (error "Message not recognised")))
    ([f arg]
     (cond (= f 'cons) (create-dispatcher (conj l arg))
           (= f 'find) (as-find arg l)
           :else (error "Message not recognised")))))

(defn make-empty-as [] (create-dispatcher '()))

(defn as-show [as]
  (if (as 'null?)
    '()
    (conj (as-show (as 'cdr)) (as 'car))))


(def a1 (make-empty-as))
(assert (a1 'null?))

(def a2 (a1 'cons '(b 2)))
(def a3 (a2 'cons '(d 4)))
(def a4 (a3 'cons '(c 5)))
(def a5 (a4 'cons '(a 6)))
(def a6 (a5 'cons '(c 4)))
(def a7 (a6 'cons '(b 7)))
(def a8 (a7 'cons '(a 1)))


(assert (= (a8 'find 'b) '(7 2)))
(assert (= (a8 'find 'a) '(1 6)))
(assert (= (a7 'find 'a) '(6)))

(assert (= (a2 'car) '(b 2)))
(assert (= (a6 'car) '(c 4)))
(assert (= (as-show a8) '((a 1) (b 7) (c 4) (a 6) (c 5) (d 4) (b 2))))
(assert (= ((a8 'cdr) 'find 'a) '(6)))