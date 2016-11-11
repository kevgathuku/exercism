(ns binary-search)

(defn middle
  [haystack]
  (quot (count haystack) 2))

(defn search-for
  [needle haystack]
  (let [low-idx 0 high-idx (dec (count haystack)) mid-idx (middle haystack)]
    (cond
      (= ((vec haystack) low-idx) needle) low-idx
      (= ((vec haystack) mid-idx) needle) mid-idx
      (= ((vec haystack) high-idx) needle) high-idx
      )
    (loop [low low-idx high high-idx]
      (if (> low high)
        (throw (Exception. "not found"))
        (let [mid (quot (+ low high) 2) mid-val ((vec haystack) mid)]
          (cond
            (= mid-val needle) mid
            (< mid-val needle) (recur (inc mid) high)
            (> mid-val needle) (recur low (dec mid))))))))
