; Запуск из папки CLIPS: (batch "t2/task2.bat")
(clear)
(load "t2/task2.clp")
(reset)
(assert (poezd 104 Kazan "12:15"))
(assert (poezd 105 Ufa "14:00"))
(facts)

; Удаляем поезда f-1 и f-4.
(retract 1 4)

; Упорядоченные факты изменяются удалением и добавлением.
(retract 2 3)
(assert (poezd 102 Samara "10:00"))
(assert (poezd 103 Saratov "11:45"))
(facts)
