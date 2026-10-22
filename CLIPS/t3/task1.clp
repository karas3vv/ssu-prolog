; Тема 3, задание 1. citi — имя слота из методички.
(deftemplate client
    (slot name (type SYMBOL))
    (slot in (type INTEGER))
    (slot citi (type SYMBOL) (default Samara))
)

(deffacts clients
    (client (name Ivanov) (in 101))
    (client (name Petrov) (in 102))
    (client (name Sidorov) (in 103))
)
