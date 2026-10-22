; Тема 5, задание 6. НОД двух натуральных чисел.
; Алгоритм Евклида с вычитанием, как в подсказке методички.
(defrule nod
    =>
    (printout t "a (positive integer): ")
    (bind ?a (read))
    (printout t "b (positive integer): ")
    (bind ?b (read))
    (if (or (not (integerp ?a)) (not (integerp ?b))) then
        (printout t "Expected two integers." crlf)
        (return))
    (if (or (< ?a 1) (< ?b 1)) then
        (printout t "Both numbers must be positive." crlf)
        (return))
    (while (neq ?a ?b) do
        (if (> ?a ?b)
            then (bind ?a (- ?a ?b))
            else (bind ?b (- ?b ?a))))
    (printout t "GCD = " ?a crlf)
)
