; Часть А. Запуск из папки CLIPS: (batch "t3/task1_a.bat")
(clear)
(load "t3/task1.clp")
(reset)
(facts)

(modify 1 (citi Moscow))
(modify 2 (name Smirnov))
(duplicate 3 (in 104))
(facts)

; Явно сохраняем только клиентов, без initial-fact старого CLIPS.
(save-facts "t3/clients_a.fct" local client)
