(ns hello-world)

(defn hello
  "greet someone given their name"
  ([] (hello "World"))
  ([name]
    (str "Hello, " name "!"))
)
