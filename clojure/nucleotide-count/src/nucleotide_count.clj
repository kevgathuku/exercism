(ns nucleotide-count
  (:require [clojure.string :refer [split blank?]]))

(defn nucleotide-counts
  ([nuc]
   (let [default-count {\A 0, \T 0, \C 0, \G 0}]
     (if (blank? nuc)
       default-count
       (merge default-count (frequencies nuc))))))

(defn count
  ([symbol nuc]
   (if (.contains (split "GACT" #"") (str symbol))
     (get (frequencies nuc) symbol 0)
     (throw (AssertionError.)))))
