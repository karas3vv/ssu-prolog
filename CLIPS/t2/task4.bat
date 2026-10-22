; Запуск из папки CLIPS: (batch "t2/task4.bat")
(clear)
(load "t2/task4.clp")
(reset)
(assert (tovar coffee Brazil 600 5))
(assert (tovar rice China 100 15))
(facts)

; Меняем цену товаров f-2 и f-4.
(retract 2 4)
(assert (tovar tea India 220 10))
(assert (tovar coffee Brazil 650 5))
(facts)

; Удаляем все факты, сохраняя конструкцию deffacts.
(retract *)
(facts)
