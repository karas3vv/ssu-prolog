; Тема 7, задание 1. Заменить все вхождения указанного символа другим.
; Ввод через readline: без кавычек, каждая строка отдельно.
(defrule replace-character
    =>
    (printout t "Text: ")
    (bind ?text (readline))
    (printout t "Character to replace: ")
    (bind ?old (readline))
    (printout t "New character: ")
    (bind ?new (readline))
    (if (not (and (stringp ?text) (stringp ?old) (stringp ?new))) then
        (printout t "Expected three lines of text." crlf)
        (return))
    (if (or (neq (str-length ?old) 1) (neq (str-length ?new) 1)) then
        (printout t "Enter exactly one character for each replacement field." crlf)
        (return))
    (bind ?result "")
    (loop-for-count (?i 1 (str-length ?text)) do
        (bind ?char (sub-string ?i ?i ?text))
        (if (eq ?char ?old) then (bind ?char ?new))
        (bind ?result (str-cat ?result ?char)))
    (printout t "Result: " ?result crlf)
)
