(ns series)


(defn slices [string length]
  (cond 
    (= length 0) [""]
    (> length (count string)) []
    :else
    (loop [start-index 0 end-index length result '()]
      (if (> end-index (count string))
        result
        (recur (inc start-index) (inc end-index) (conj result (subs string start-index end-index)))))))
