(ns bob
  (:require [clojure.string :as str]))

(defn response-for
  "Bob's responses to different statement"
  ([message]
    (if (str/blank? message) "Fine. Be that way!"
      (if (and (= (str/upper-case message) message) (not= message (str/lower-case message)))
        "Whoa, chill out!"
        (if (str/ends-with? message "?") "Sure."
          "Whatever.")))
  )
)
