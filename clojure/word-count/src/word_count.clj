(ns word-count
  (:require [clojure.string :refer [lower-case replace split]]))

(defn word-count
  ([words]
   (-> words
       (replace #"[^a-zA-Z0-9\s]" "")
       (lower-case)
       (split #"\s+")
       (frequencies))))
