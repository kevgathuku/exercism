(ns collatz-conjecture)

(defn compute-collatz [num acc]
  (cond
    (= num 1) acc
    (even? num) (compute-collatz (/ num 2) (inc acc))
    (odd? num)  (compute-collatz (+ 1 (* num 3)) (inc acc))))
    

(defn collatz [num]
  {:pre [(pos? num)]}
  (compute-collatz num 0))

