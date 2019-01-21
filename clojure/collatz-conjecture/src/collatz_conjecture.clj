(ns collatz-conjecture)

(defn collatz
  ([num]
   {:pre [(pos? num)]}
   (collatz num 0))

  ([num steps]
   (cond
     (= num 1) steps
     (even? num) (collatz (/ num 2) (inc steps))
     (odd? num)  (collatz (+ 1 (* num 3)) (inc steps)))))
