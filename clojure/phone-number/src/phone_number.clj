(ns phone-number
  (:require [clojure.string :as string]))


(defn- to-string [sequence]
  "Utility function to convert the sequence of characters to a string
  e.g. the sequence returned from take / drop"
  (apply str sequence))


(defn validate-11-digits [digits]
  (if (and (= \1 (first digits)) (= 11 (count digits)))
           (to-string (next digits))
           "0000000000"))


(defn clean-string [num-string]
  (string/replace num-string #"\W" ""))


(defn number [num-string]
   (let [cleaned-string (clean-string num-string) num-string-count (count cleaned-string)]
     (cond
       (= num-string-count 9) "0000000000"
       (= num-string-count 10) cleaned-string
       (= num-string-count 11) (validate-11-digits cleaned-string))))
     

(defn area-code [num-string]
  "Extracts the area code from a phone number"
  (->> (number num-string)
       (take 3)
       (to-string)))


(defn- pretty-print-area-code [area-code-string]
  "Pretty-prints the area-code portion of the phone number"
  (str "(" area-code-string ")"))


(defn- pretty-print-rest-of-number [rest-of-number]
  "Pretty-prints the phone number excluding the area code"
  (let [[first-three last-three] (split-at 3 rest-of-number)]
    (str (to-string first-three) "-" (to-string last-three))))


(defn pretty-print [num-string]
  (let [parsed-number (number num-string) [area-code-string rest-of-number-string] (split-at 3 parsed-number)]
   (str (pretty-print-area-code (to-string area-code-string)) " " (pretty-print-rest-of-number (to-string rest-of-number-string)))))

