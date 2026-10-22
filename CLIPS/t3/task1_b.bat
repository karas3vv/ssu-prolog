; Часть Б. Сначала выполните task1_a.bat.
; Запуск из папки CLIPS: (batch "t3/task1_b.bat")
(clear)
(load "t3/task1.clp")
; Убираем исходный набор, чтобы загрузить именно сохраненный список.
(undeffacts clients)
(reset)
(load-facts "t3/clients_a.fct")
(facts)

(assert (client (name Kuznetsov) (in 105) (citi Kazan)))
(assert (client (name Orlov) (in 106)))
(retract 1 3)
(facts)
(save-facts "t3/clients_b.fct" local client)
