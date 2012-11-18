; Task 2.1
(defn sqr [x] (* x x))

(defn derive [f k]
  (fn [x]
      (/ (- (f (+ k x)) (f (- x k)))
         (* 2 k))))

(def ablsqr (derive sqr 0.1))

(assert (= (clojure.contrib.math/round (ablsqr 1)) 2.0))
(assert (= (clojure.contrib.math/round (ablsqr 2)) 4.0))
(assert (= (clojure.contrib.math/round (ablsqr 3)) 6.0))


; Task 2.2
(def threshold 0.0001)

(defn abs [x]
  (if (< x 0) (* x -1) x))

(defn in-treshold [a b treshold]
  (<= (abs (- a b)) treshold))

(defn iter-until
  ([f initial threshold]
   (iter-until f initial (f initial) threshold))
  ([f previous current threshold]
   (if (in-treshold previous current threshold)
     current
     (iter-until f current (f current) threshold))))

(defn make-nstf [f]
  (let [fd (derive f threshold)
        fiter (fn [x] (- x (/
              (f x)
              (fd x))))]
  (fn [x] (iter-until fiter (fiter x) threshold))))

(defn myfunc [x] (- (* 3 x x) 2))
(def nstf (make-nstf myfunc))

(nstf 2)
(nstf -2)