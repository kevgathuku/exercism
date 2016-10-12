(ns hello-world)

(defn hello
  "greet someone given their name"
  ([]
    "Hello, World!")
  ([name]
    (clojure.string/replace "Hello, name!" #"name" name))
)
