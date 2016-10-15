(ns nucleotide-count
  (:require [clojure.string :refer [blank?]]))

(defn nucleotide-counts
  ([nuc]
   (let [default-count {\A 0, \T 0, \C 0, \G 0}]
     (if (blank? nuc)
       default-count
       (merge default-count (frequencies nuc))))))

(defn count
  ([symbol nuc]
  (assert (contains? #{\A \T \C \G} symbol) "Invalid Character")
  (get (frequencies nuc) symbol 0)))
