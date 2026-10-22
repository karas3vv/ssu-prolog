; Тема 6, задание 8. Рекурсивная сумма S(n) = sum(1/i^2), i=1..n.
(deffunction sum-inverse-squares (?n)
    (if (not (integerp ?n)) then
        (printout t "Expected an integer n." crlf)
        (return FALSE))
    (if (< ?n 0) then
        (printout t "n must be nonnegative." crlf)
        (return FALSE))
    ; Базовый случай: пустая сумма, прекращение рекурсии.
    (if (= ?n 0) then (return 0.0))
    (+ (sum-inverse-squares (- ?n 1)) (/ 1.0 (** ?n 2)))
)

(defrule recursive-sum-input
    =>
    (printout t "n (nonnegative integer): ")
    (bind ?sum (sum-inverse-squares (read)))
    (if (neq ?sum FALSE) then
        (printout t "S = " ?sum crlf))
)
