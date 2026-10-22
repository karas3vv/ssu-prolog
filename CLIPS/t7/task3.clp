; Тема 7, задание 3. Удалить все вхождения подстроки.
(defrule delete-substring
    =>
    (printout t "Text: ")
    (bind ?text (readline))
    (printout t "Substring to delete: ")
    (bind ?part (readline))
    (if (not (and (stringp ?text) (stringp ?part))) then
        (printout t "Expected two lines of text." crlf)
        (return))
    ; Пустая подстрока не уменьшает текст и привела бы к бесконечному циклу.
    (if (= (str-length ?part) 0) then
        (printout t "Substring must not be empty." crlf)
        (return))
    (bind ?position (str-index ?part ?text))
    (while (neq ?position FALSE) do
        (bind ?left (sub-string 1 (- ?position 1) ?text))
        (bind ?right (sub-string (+ ?position (str-length ?part))
                                (str-length ?text) ?text))
        (bind ?text (str-cat ?left ?right))
        ; Повторяем поиск в измененной строке до полного отсутствия подстроки.
        (bind ?position (str-index ?part ?text)))
    (printout t "Result: " ?text crlf)
)
