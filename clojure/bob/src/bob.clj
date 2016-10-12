(ns bob
  (:require [clojure.string :as str]))

(defn isUpper [message]
  (and
    (= (str/upper-case message) message)
    (not= (str/lower-case message) message)
  )
)

(defn response-for
  "Bob's responses to different statement"
  ([message]
    (if (str/blank? message) "Fine. Be that way!"
      (if (isUpper message) "Whoa, chill out!"
        (if (str/ends-with? message "?") "Sure."
          "Whatever.")))
  )
)
