(ns rna-transcription)

(def dna-map {\G "C" \C "G" \T "A" \A "U"})

(defn get-rna [char]
  (if (nil? (dna-map char))
    (throw (AssertionError. "Invalid Data"))
    (dna-map char)))

(defn to-rna
  "Transcribe A DNA strand to its RNA complement"
  ([strand]
   (reduce (fn [acc, name] (str acc (get-rna name))) "" strand)))
