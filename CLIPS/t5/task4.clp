; Тема 5, задание 4. S = 1/2^2 + 1/4^2 + ... + 1/(2n)^2.
(defrule sum-even-squares
    =>
    (printout t "n (positive integer): ")
    (bind ?n (read))
    (if (not (integerp ?n)) then
        (printout t "Expected an integer." crlf)
        (return))
    (if (< ?n 1) then
        (printout t "n must be positive." crlf)
        (return))
    (bind ?sum 0.0)
    (loop-for-count (?i 1 ?n) do
        (bind ?sum (+ ?sum (/ 1.0 (** (* 2 ?i) 2)))))
    (printout t "S = " ?sum crlf)
)
