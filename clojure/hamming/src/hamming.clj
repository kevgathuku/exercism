(ns hamming
  (:require [clojure.string :as str]))


(defn distance
  [strand1 strand2]
  "Calculate the Hamming Distance between two DNA strands."
  (when (= (count strand1) (count strand2))
           (reduce + (map #(if (= %1 %2) 0 1) strand1 strand2))))
