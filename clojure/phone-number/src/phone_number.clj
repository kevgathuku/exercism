(ns phone-number
  (:require [clojure.string :as string]))


(defn validate-11-digits [digits]
  (if (and (= \1 (first digits)) (= 11 (count digits))) (apply str (next digits)) "0000000000"))
  


(defn clean-string [num-string]
  (string/replace num-string #"\W" ""))
  

(defn number [num-string]
   (let [clean-num-string (clean-string num-string) num-string-count (count clean-num-string)]
     (cond
       (= num-string-count 9) "0000000000"
       (= num-string-count 10) clean-num-string
       (= num-string-count 11) (validate-11-digits clean-num-string))))
     
  


(defn area-code [num-string]) ;; <- arglist goes here
  ;; your code goes here


(defn pretty-print [num-string]) ;; <- arglist goes here
  ;; your code goes here

