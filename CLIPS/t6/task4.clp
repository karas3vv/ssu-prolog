; Тема 6, задание 4. Кусочно заданная функция с параметром a:
; x < 0: |x-a| / x^2; x = 0: 0; x > 0: sin(x+a).
(deffunction piecewise-y (?x ?a)
    (if (< ?x 0) then
        (return (/ (abs (- ?x ?a)) (** ?x 2))))
    (if (= ?x 0) then (return 0))
    (sin (+ ?x ?a))
)

(defrule piecewise-input
    =>
    (printout t "x: ")
    (bind ?x (read))
    (printout t "a: ")
    (bind ?a (read))
    (if (not (and (numberp ?x) (numberp ?a))) then
        (printout t "x and a must be numbers." crlf)
        (return))
    (printout t "Y = " (piecewise-y ?x ?a) crlf)
)
