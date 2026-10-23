; Тема 4, задание 2.
; Наименование, цена, количество, год производства, страна.
(deffacts goods
    (tovar radio 2000 10 2009 Russia)
    (tovar kettle 3000 3 2025 China)
    (tovar coffee-maker 10000 8 2026 Italy)
    (tovar iron 4000 6 2026 Russia)
    (tovar toaster 2500 2 2008 Germany)
)

; Достаточно одного условия: выпуск до 2010 года ИЛИ остаток менее 4.
; test с or позволяет получить одну активацию и при выполнении обоих.
(defrule markdown
    (tovar ?name ?price ?quantity ?year ?country)
    (test (or (< ?year 2010) (< ?quantity 4)))
    (not (ucenka ?name ?))
    =>
    (assert (ucenka ?name (* ?price 0.15)))
)

; Россия обозначена единым символом Russia во всех исходных фактах.
(defrule import-markup
    (tovar ?name ?price ?quantity ?year ?country)
    (test (and (= ?year ?*current-year*) (neq ?country Russia)))
    (not (nacenka ?name ?))
    =>
    (assert (nacenka ?name (* ?price 0.07)))
)

(defrule russian-goods-exist
    (exists (tovar ? ? ? ? Russia))
    =>
    (printout t "There are goods made in Russia." crlf)
)

(defrule no-russian-goods
    (not (tovar ? ? ? ? Russia))
    =>
    (printout t "There are no goods made in Russia." crlf)
)
