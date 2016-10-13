(ns word-count
  (:require [clojure.string :refer [lower-case replace split]]))

(defn word-count
  ([words]
   (frequencies (split (lower-case (replace words #"[^a-zA-Z0-9\s]" "")) #"\s+"))))
