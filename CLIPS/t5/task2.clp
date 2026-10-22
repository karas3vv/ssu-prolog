; Тема 5, задание 2. Ввод списка сотрудников.
; ФИО и должность с пробелами вводите в двойных кавычках.
(defrule spisok_sotr
    =>
    (printout t "Number of employees: ")
    (bind ?n (read))
    (if (not (integerp ?n)) then
        (printout t "Expected an integer count." crlf)
        (return))
    (if (< ?n 0) then
        (printout t "Count must be nonnegative." crlf)
        (return))
    (loop-for-count (?i 1 ?n) do
        (printout t "Employee " ?i ", full name: ")
        (bind ?name (read))
        (printout t "Position: ")
        (bind ?position (read))
        (if (or (not (lexemep ?name)) (not (lexemep ?position))) then
            (printout t "Expected a name and position as text." crlf)
            (return))
        (if (or (eq ?name EOF) (eq ?position EOF)) then
            (printout t "Input ended before the list was complete." crlf)
            (return))
        (assert (sotrudnik ?name ?position)))
    (facts)
)
