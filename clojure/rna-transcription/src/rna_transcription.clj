(ns rna-transcription)

(defn get-rna [char]
  (let [dna-map {\G "C" \C "G" \T "A" \A "U"}]
    (or (dna-map char) (throw (AssertionError. "Invalid Data")))))

(defn to-rna
  "Transcribe A DNA strand to its RNA complement"
  ([strand]
   (reduce #(str %1 (get-rna %2)) "" strand)))

