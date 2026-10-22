; Тема 6, задание 1. Длина отрезка и периметр треугольника.
(deffunction segment-length (?x1 ?y1 ?x2 ?y2)
    (sqrt (+ (** (- ?x2 ?x1) 2) (** (- ?y2 ?y1) 2)))
)

; Функция длины отрезка определена до использующей ее функции.
(deffunction triangle-perimeter (?x1 ?y1 ?x2 ?y2 ?x3 ?y3)
    (+ (segment-length ?x1 ?y1 ?x2 ?y2)
       (segment-length ?x2 ?y2 ?x3 ?y3)
       (segment-length ?x3 ?y3 ?x1 ?y1))
)

(defrule perimeter-input
    =>
    (printout t "Vertex A, x: ")
    (bind ?x1 (read))
    (printout t "Vertex A, y: ")
    (bind ?y1 (read))
    (printout t "Vertex B, x: ")
    (bind ?x2 (read))
    (printout t "Vertex B, y: ")
    (bind ?y2 (read))
    (printout t "Vertex C, x: ")
    (bind ?x3 (read))
    (printout t "Vertex C, y: ")
    (bind ?y3 (read))
    (if (not (and (numberp ?x1) (numberp ?y1)
                  (numberp ?x2) (numberp ?y2)
                  (numberp ?x3) (numberp ?y3))) then
        (printout t "Coordinates must be numbers." crlf)
        (return))
    (printout t "P = " (triangle-perimeter ?x1 ?y1 ?x2 ?y2 ?x3 ?y3) crlf)
)
