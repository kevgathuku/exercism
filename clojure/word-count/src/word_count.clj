(ns word-count
  (:require [clojure.string :as str]))

(defn word-count
  ([text]
   (->> text
        (str/lower-case)
        (re-seq #"\w+")
        (frequencies))))
