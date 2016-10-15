(ns beer-song
  (:require [clojure.string :as str :refer [join]]))

(defn many [n] (format "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n" n n (dec n)))

(def two "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n")
(def one "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n")
(def zero "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n")

(defn verse
  ([num]
    (case num
      0 zero
      1 one
      2 two
      (many num))))

(defn sing
  ([start] (sing start 0))
  ([start stop]
    (let [verses (map verse (range start (dec stop) -1))]
      (str/replace (reduce (fn [acc, name] (str acc name "\n")) "" verses) #"\n\n$" "\n"))))
