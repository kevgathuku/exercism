(ns bob
  (:require [clojure.string :as str]))

(defn is-upper [message]
  (and
    (= (str/upper-case message) message)
    (not= (str/lower-case message) message)))


(defn is-question [message]
  (str/ends-with? message "?"))
  

(defn response-for
  "Bob's responses to different statement"
  ([message]
   (cond
     (str/blank? message) "Fine. Be that way!"
     (and (is-upper message) (is-question message)) "Calm down, I know what I'm doing!"
     (is-upper message)   "Whoa, chill out!"
     (is-question message) "Sure."
     :else "Whatever.")))  

