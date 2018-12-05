(ns anagram
  (:require [clojure.string :refer [lower-case]]))

(defn equal-frequencies?
  ([first second]
   (= (frequencies (lower-case first)) (frequencies (lower-case second)))))

(defn anagrams-for
  ([word candidates]
   (filterv (fn [cand]
      (and (not (= (lower-case word) (lower-case cand)))
        (equal-frequencies? word cand))) candidates)))