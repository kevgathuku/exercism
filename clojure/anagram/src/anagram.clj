(ns anagram
  (:require [clojure.string :as str]))


(defn equal-frequencies?
  ([first second]
   (= (frequencies (str/lower-case first)) (frequencies (str/lower-case second)))))


(defn is-same-word [word candidate]
  (= (str/lower-case word) (str/lower-case candidate)))


(defn anagrams-for
  ([word candidates]
   (filterv #(and
                  (not (is-same-word word %1))
                  (equal-frequencies? word %1))
             candidates)))
