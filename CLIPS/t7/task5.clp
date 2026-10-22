; Тема 7, задание 5. Удалить лишние пробелы.
; Убираем пробелы по краям, между словами оставляем ровно один.
(deffunction normalize-spaces (?text)
    (bind ?result "")
    (bind ?space-pending FALSE)
    (loop-for-count (?i 1 (str-length ?text)) do
        (bind ?char (sub-string ?i ?i ?text))
        (if (eq ?char " ")
            then
                ; Начальные пробелы пропускаем. Остальные откладываем
                ; до следующего непробельного символа.
                (if (> (str-length ?result) 0) then
                    (bind ?space-pending TRUE))
            else
                (if ?space-pending then
                    (bind ?result (str-cat ?result " ")))
                (bind ?result (str-cat ?result ?char))
                (bind ?space-pending FALSE)))
    ?result
)

(defrule normalize-spaces-input
    =>
    (printout t "Text: ")
    (bind ?text (readline))
    (if (not (stringp ?text)) then
        (printout t "Expected a line of text." crlf)
        (return))
    (printout t "Result: " (normalize-spaces ?text) crlf)
)
