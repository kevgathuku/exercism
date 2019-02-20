(ns clock)


(defn process-hours [hours]
  (if (< hours 0)
    (->> (mod hours 24)
         (format "%02d"))
  
    (->> (mod hours 12)
         (format "%02d"))))
  

(defn process-minutes [minutes]
  (let [mins (->> (mod minutes 60)
                  (format "%02d"))
        extra-hours (quot minutes 60)]
    (if (< minutes 0)
      [mins (- extra-hours 1)]
      [mins extra-hours])))


(defn clock->string [clock]
  (str (first clock) ":" (second clock)))


(defn clock [hours minutes]
  (let [[processed-minutes extra-hours] (process-minutes minutes)
        processed-hours (process-hours (+ hours extra-hours))]
    [processed-hours processed-minutes]))


(defn add-time [clock time])


