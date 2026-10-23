; SportExpert — распознавание 20 видов спорта по ответам пользователя.
; Основа базы знаний: t7/task1.pl. Кодировка UTF-8, CLIPS 6.4.
; Запуск: (clear) (load "sport_expert.clp") (reset) (run)
; Идентификаторы — ASCII, вопросы и результаты — на русском.

(deftemplate question (slot id) (slot text))
(deftemplate candidate (slot id) (slot priority (type INTEGER)))
(deftemplate requirement (slot sport) (slot question) (slot expected) (slot position (type INTEGER)))
(deftemplate answer (slot question) (slot value (allowed-symbols yes no)))
(deftemplate result (slot sport) (slot name))

; Ввод целой строки: точку после ответа ставить не нужно.
; При EOF или команде stop консультация завершается без диагноза.
(deffunction ask-yes-no (?text)
    (while TRUE do
        (printout t ?text "? (да/нет; stop — выход): ")
        (bind ?input (readline))
        (if (eq ?input EOF) then (return stop))
        (bind ?tokens (explode$ ?input))
        (if (= (length$ ?tokens) 1) then
            (bind ?word (lowcase (str-cat (nth$ 1 ?tokens))))
            (if (member$ ?word (create$ "да" "yes" "y")) then (return yes))
            (if (member$ ?word (create$ "нет" "no" "n")) then (return no))
            (if (eq ?word "stop") then (return stop)))
        (printout t "Введите да или нет без точки." crlf)))

(deffacts knowledge-base
    (question (id q1) (text "это командная игра с мячом"))
    (question (id q2) (text "мяч в основном передают и бьют ногами"))
    (question (id q3) (text "мяч забрасывают в корзину"))
    (question (id q4) (text "мяч перебрасывают руками через высокую сетку"))
    (question (id q5) (text "мяч забрасывают руками в ворота"))
    (question (id q6) (text "игра проходит в бассейне"))
    (question (id q7) (text "используют овальный мяч, который нужно занести в зачётную зону"))
    (question (id q8) (text "используют ракетку"))
    (question (id q9) (text "играют на столе"))
    (question (id q10) (text "вместо мяча используют волан"))
    (question (id q11) (text "мяч отбивают ракеткой через сетку на корте"))
    (question (id q12) (text "соревнования проходят на снегу или льду"))
    (question (id q13) (text "используют клюшку и шайбу"))
    (question (id q14) (text "на коньках выполняют прыжки и вращения под музыку"))
    (question (id q15) (text "спортсмены проходят дистанцию на беговых лыжах"))
    (question (id q16) (text "во время гонки стреляют по мишеням"))
    (question (id q17) (text "спортсмен спускается по снегу на одной широкой доске"))
    (question (id q18) (text "это поединок двух соперников"))
    (question (id q19) (text "соперники наносят удары кулаками в боксёрских перчатках"))
    (question (id q20) (text "соперники в кимоно выполняют броски и удержания на татами"))
    (question (id q21) (text "соперники используют рапиру, шпагу или саблю"))
    (question (id q22) (text "соревнования проходят в воде"))
    (question (id q23) (text "спортсмены соревнуются в скорости плавания"))
    (question (id q24) (text "спортсмен прыгает в воду с трамплина или вышки"))
    (question (id q25) (text "используют велосипед"))
    (question (id q26) (text "спортсмены соревнуются в скорости езды на велосипеде"))
    (candidate (id sport1) (priority 1)) ; футбол
    (requirement (sport sport1) (question q1) (expected yes) (position 1))
    (requirement (sport sport1) (question q2) (expected yes) (position 2))
    (candidate (id sport2) (priority 2)) ; баскетбол
    (requirement (sport sport2) (question q1) (expected yes) (position 1))
    (requirement (sport sport2) (question q3) (expected yes) (position 2))
    (candidate (id sport3) (priority 3)) ; волейбол
    (requirement (sport sport3) (question q1) (expected yes) (position 1))
    (requirement (sport sport3) (question q4) (expected yes) (position 2))
    (candidate (id sport4) (priority 4)) ; гандбол
    (requirement (sport sport4) (question q1) (expected yes) (position 1))
    (requirement (sport sport4) (question q5) (expected yes) (position 2))
    (requirement (sport sport4) (question q6) (expected no) (position 3))
    (candidate (id sport5) (priority 5)) ; водное поло
    (requirement (sport sport5) (question q1) (expected yes) (position 1))
    (requirement (sport sport5) (question q5) (expected yes) (position 2))
    (requirement (sport sport5) (question q6) (expected yes) (position 3))
    (candidate (id sport6) (priority 6)) ; регби
    (requirement (sport sport6) (question q1) (expected yes) (position 1))
    (requirement (sport sport6) (question q7) (expected yes) (position 2))
    (candidate (id sport7) (priority 7)) ; теннис
    (requirement (sport sport7) (question q8) (expected yes) (position 1))
    (requirement (sport sport7) (question q9) (expected no) (position 2))
    (requirement (sport sport7) (question q10) (expected no) (position 3))
    (requirement (sport sport7) (question q11) (expected yes) (position 4))
    (candidate (id sport8) (priority 8)) ; настольный теннис
    (requirement (sport sport8) (question q8) (expected yes) (position 1))
    (requirement (sport sport8) (question q9) (expected yes) (position 2))
    (candidate (id sport9) (priority 9)) ; бадминтон
    (requirement (sport sport9) (question q8) (expected yes) (position 1))
    (requirement (sport sport9) (question q10) (expected yes) (position 2))
    (candidate (id sport10) (priority 10)) ; хоккей с шайбой
    (requirement (sport sport10) (question q12) (expected yes) (position 1))
    (requirement (sport sport10) (question q13) (expected yes) (position 2))
    (candidate (id sport11) (priority 11)) ; фигурное катание
    (requirement (sport sport11) (question q12) (expected yes) (position 1))
    (requirement (sport sport11) (question q14) (expected yes) (position 2))
    (candidate (id sport12) (priority 12)) ; лыжные гонки
    (requirement (sport sport12) (question q12) (expected yes) (position 1))
    (requirement (sport sport12) (question q15) (expected yes) (position 2))
    (requirement (sport sport12) (question q16) (expected no) (position 3))
    (candidate (id sport13) (priority 13)) ; биатлон
    (requirement (sport sport13) (question q12) (expected yes) (position 1))
    (requirement (sport sport13) (question q15) (expected yes) (position 2))
    (requirement (sport sport13) (question q16) (expected yes) (position 3))
    (candidate (id sport14) (priority 14)) ; сноуборд
    (requirement (sport sport14) (question q12) (expected yes) (position 1))
    (requirement (sport sport14) (question q17) (expected yes) (position 2))
    (candidate (id sport15) (priority 15)) ; бокс
    (requirement (sport sport15) (question q18) (expected yes) (position 1))
    (requirement (sport sport15) (question q19) (expected yes) (position 2))
    (candidate (id sport16) (priority 16)) ; дзюдо
    (requirement (sport sport16) (question q18) (expected yes) (position 1))
    (requirement (sport sport16) (question q20) (expected yes) (position 2))
    (candidate (id sport17) (priority 17)) ; фехтование
    (requirement (sport sport17) (question q18) (expected yes) (position 1))
    (requirement (sport sport17) (question q21) (expected yes) (position 2))
    (candidate (id sport18) (priority 18)) ; плавание
    (requirement (sport sport18) (question q22) (expected yes) (position 1))
    (requirement (sport sport18) (question q23) (expected yes) (position 2))
    (candidate (id sport19) (priority 19)) ; прыжки в воду
    (requirement (sport sport19) (question q22) (expected yes) (position 1))
    (requirement (sport sport19) (question q24) (expected yes) (position 2))
    (candidate (id sport20) (priority 20)) ; велоспорт
    (requirement (sport sport20) (question q25) (expected yes) (position 1))
    (requirement (sport sport20) (question q26) (expected yes) (position 2))
)

(defrule welcome
    (declare (salience 1000))
    =>
    (printout t crlf "SportExpert — экспертная система «Вид спорта»" crlf
        "Загадайте вид спорта и отвечайте на вопросы о его признаках." crlf
        "Ответы сохраняются до следующего (reset)." crlf crlf))

; Отбрасываем гипотезу, если известный ответ противоречит её условию.
(defrule eliminate-candidate
    (declare (salience 100))
    (not (finished))
    ?c <- (candidate (id ?sport))
    (requirement (sport ?sport) (question ?q) (expected ?expected))
    (answer (question ?q) (value ?actual&~?expected))
    =>
    (retract ?c))

; Нижний уровень: из ответов выводятся общие категории спорта.
(defrule category-team-ball
    (declare (salience 50))
    (answer (question q1) (value yes))
    (not (category team-ball))
    =>
    (assert (category team-ball)))

(defrule category-racket
    (declare (salience 50))
    (answer (question q8) (value yes))
    (not (category racket))
    =>
    (assert (category racket)))

(defrule category-winter
    (declare (salience 50))
    (answer (question q12) (value yes))
    (not (category winter))
    =>
    (assert (category winter)))

(defrule category-combat
    (declare (salience 50))
    (answer (question q18) (value yes))
    (not (category combat))
    =>
    (assert (category combat)))

(defrule category-water
    (declare (salience 50))
    (answer (question q22) (value yes))
    (not (category water))
    =>
    (assert (category water)))

(defrule category-bicycle
    (declare (salience 50))
    (answer (question q25) (value yes))
    (not (category bicycle))
    =>
    (assert (category bicycle)))

; Верхний уровень: 20 отдельных продукционных правил распознавания.
(defrule recognize-sport1
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport1))
    (category team-ball)
    (answer (question q1) (value yes))
    (answer (question q2) (value yes))
    =>
    (assert (result (sport sport1) (name "футбол"))))

(defrule recognize-sport2
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport2))
    (category team-ball)
    (answer (question q1) (value yes))
    (answer (question q3) (value yes))
    =>
    (assert (result (sport sport2) (name "баскетбол"))))

(defrule recognize-sport3
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport3))
    (category team-ball)
    (answer (question q1) (value yes))
    (answer (question q4) (value yes))
    =>
    (assert (result (sport sport3) (name "волейбол"))))

(defrule recognize-sport4
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport4))
    (category team-ball)
    (answer (question q1) (value yes))
    (answer (question q5) (value yes))
    (answer (question q6) (value no))
    =>
    (assert (result (sport sport4) (name "гандбол"))))

(defrule recognize-sport5
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport5))
    (category team-ball)
    (answer (question q1) (value yes))
    (answer (question q5) (value yes))
    (answer (question q6) (value yes))
    =>
    (assert (result (sport sport5) (name "водное поло"))))

(defrule recognize-sport6
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport6))
    (category team-ball)
    (answer (question q1) (value yes))
    (answer (question q7) (value yes))
    =>
    (assert (result (sport sport6) (name "регби"))))

(defrule recognize-sport7
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport7))
    (category racket)
    (answer (question q8) (value yes))
    (answer (question q9) (value no))
    (answer (question q10) (value no))
    (answer (question q11) (value yes))
    =>
    (assert (result (sport sport7) (name "теннис"))))

(defrule recognize-sport8
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport8))
    (category racket)
    (answer (question q8) (value yes))
    (answer (question q9) (value yes))
    =>
    (assert (result (sport sport8) (name "настольный теннис"))))

(defrule recognize-sport9
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport9))
    (category racket)
    (answer (question q8) (value yes))
    (answer (question q10) (value yes))
    =>
    (assert (result (sport sport9) (name "бадминтон"))))

(defrule recognize-sport10
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport10))
    (category winter)
    (answer (question q12) (value yes))
    (answer (question q13) (value yes))
    =>
    (assert (result (sport sport10) (name "хоккей с шайбой"))))

(defrule recognize-sport11
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport11))
    (category winter)
    (answer (question q12) (value yes))
    (answer (question q14) (value yes))
    =>
    (assert (result (sport sport11) (name "фигурное катание"))))

(defrule recognize-sport12
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport12))
    (category winter)
    (answer (question q12) (value yes))
    (answer (question q15) (value yes))
    (answer (question q16) (value no))
    =>
    (assert (result (sport sport12) (name "лыжные гонки"))))

(defrule recognize-sport13
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport13))
    (category winter)
    (answer (question q12) (value yes))
    (answer (question q15) (value yes))
    (answer (question q16) (value yes))
    =>
    (assert (result (sport sport13) (name "биатлон"))))

(defrule recognize-sport14
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport14))
    (category winter)
    (answer (question q12) (value yes))
    (answer (question q17) (value yes))
    =>
    (assert (result (sport sport14) (name "сноуборд"))))

(defrule recognize-sport15
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport15))
    (category combat)
    (answer (question q18) (value yes))
    (answer (question q19) (value yes))
    =>
    (assert (result (sport sport15) (name "бокс"))))

(defrule recognize-sport16
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport16))
    (category combat)
    (answer (question q18) (value yes))
    (answer (question q20) (value yes))
    =>
    (assert (result (sport sport16) (name "дзюдо"))))

(defrule recognize-sport17
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport17))
    (category combat)
    (answer (question q18) (value yes))
    (answer (question q21) (value yes))
    =>
    (assert (result (sport sport17) (name "фехтование"))))

(defrule recognize-sport18
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport18))
    (category water)
    (answer (question q22) (value yes))
    (answer (question q23) (value yes))
    =>
    (assert (result (sport sport18) (name "плавание"))))

(defrule recognize-sport19
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport19))
    (category water)
    (answer (question q22) (value yes))
    (answer (question q24) (value yes))
    =>
    (assert (result (sport sport19) (name "прыжки в воду"))))

(defrule recognize-sport20
    (declare (salience 20))
    (not (finished))
    (not (result (sport ?)))
    (candidate (id sport20))
    (category bicycle)
    (answer (question q25) (value yes))
    (answer (question q26) (value yes))
    =>
    (assert (result (sport sport20) (name "велоспорт"))))

; Выбираем первую ещё возможную гипотезу и её первый неизвестный признак.
; Это сохраняет порядок проверки из Пролога, но вывод выполняют правила CLIPS.
(defrule ask-next-question
    (not (finished))
    (not (result (sport ?)))
    (candidate (id ?sport) (priority ?priority))
    (not (candidate (priority ?p&:(< ?p ?priority))))
    (requirement (sport ?sport) (question ?q) (position ?position))
    (not (answer (question ?q)))
    (not (and
        (requirement (sport ?sport) (question ?earlier) (position ?pos&:(< ?pos ?position)))
        (not (answer (question ?earlier)))))
    (question (id ?q) (text ?text))
    =>
    (bind ?value (ask-yes-no ?text))
    (if (eq ?value stop)
        then
            (assert (finished))
            (printout t crlf "Консультация прервана. Результат не определён." crlf)
        else (assert (answer (question ?q) (value ?value)))))

(defrule show-result
    (declare (salience 30))
    (not (finished))
    (result (sport ?sport) (name ?name))
    =>
    (printout t crlf "Загаданный вид спорта — " ?name "!" crlf "Основания вывода:" crlf)
    (do-for-all-facts ((?r requirement)) (eq ?r:sport ?sport)
        (do-for-all-facts ((?q question)) (eq ?q:id ?r:question)
            (printout t "  - " ?q:text ": ")
            (if (eq ?r:expected yes) then (printout t "да" crlf)
                else (printout t "нет" crlf))))
    (assert (finished)))

(defrule unknown-sport
    (declare (salience -100))
    (not (finished))
    (not (result (sport ?)))
    (not (candidate))
    =>
    (assert (finished))
    (printout t crlf "К сожалению, этот вид спорта мне не известен." crlf
        "В базе нет вида спорта, согласующегося с вашими ответами." crlf))
