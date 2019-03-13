(ns clock
  (:require [clojure.string :as string]))


(defn process-hours [hours]
  (mod hours 24))


(defn process-minutes [minutes]
  (let [mins (mod minutes 60)
        extra-hours (quot minutes 60)]
    (if (< minutes 0)
      [mins (- extra-hours 1)]
      [mins extra-hours])))


(defn clock->string [clock-instance]
  (string/join ":" (map (partial format "%02d") clock-instance)))


(defn clock [hours minutes]
  (let [[processed-minutes extra-hours] (process-minutes minutes)
        processed-hours (process-hours (+ hours extra-hours))]
    [processed-hours processed-minutes]))


(defn add-time [start-clock time]
  (clock (first start-clock) (+ time (second start-clock))))

