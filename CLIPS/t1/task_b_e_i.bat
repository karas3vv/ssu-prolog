; Тема 1. Вычисление выражений b, e, i в командной строке.
; Запуск из папки CLIPS: (batch "t1/task_b_e_i.bat")

; b) 4^2 + 28 / (5 + 2)
(printout t "b = " (+ (** 4 2) (/ 28 (+ 5 2))) crlf)

; e) max(2^3, 3^2, 2^5)
(printout t "e = " (max (** 2 3) (** 3 2) (** 2 5)) crlf)

; i) 1.1 * e^3 + |cos(sqrt(pi))| - 4/9
; e^3 вычисляется через exp; аргумент cos задается в радианах.
(printout t "i = " (- (+ (* 1.1 (exp 3)) (abs (cos (sqrt (pi))))) (/ 4 9)) crlf)
