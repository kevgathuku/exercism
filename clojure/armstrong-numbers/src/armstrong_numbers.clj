(ns armstrong-numbers
  (:require [clojure.string :as str]))


(defn num-digits [num count]
  (if (< num 10) (inc count)
    (num-digits (/ num 10) (inc count))))


(defn own-digits [num]
  (map read-string (str/split (str num) #"")))


(defn raise [num power]
  (reduce * (repeat power num)))
  

(defn armstrong? [num]
  (let [count (num-digits num 0)
        digits (own-digits num)
        armstrong (reduce + (map (fn [digit] (raise digit count)) digits))]
    (= armstrong num)))    
