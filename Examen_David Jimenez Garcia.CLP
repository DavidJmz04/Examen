(deffacts datos
	(lista 5 3 8 14 7)
	(numero 21)
)

(defrule acaba
	($?ini ?numero $?fin)
	(numero ?numero)
=>
	(printout t crlf "Ya he encontrado el numero: "  $?numero crlf)
	(halt)
)

(defrule suma
	(lista $?ini ?num1 $aux ?num2 $fin)
=>
	(assert(lista $?ini $aux $fin (+ ?num1 ?num2)))
)

(defrule resta
	(lista $?ini ?num1 $aux ?num2 $fin)
	(test(> ?num1 ?num2))
=>
	(assert(lista $?ini $aux $fin (- ?num1 ?num2)))
)

(defrule multiplicacion
	(lista $?ini ?num1 $aux ?num2 $fin)
=>
	(assert(lista $?ini $aux $fin (* ?num1 ?num2)))
)

(defrule division
	(lista $?ini ?num1 $aux ?num2 $fin)
	(test(> ?num1 ?num2))
=>
	(assert(lista $?ini $aux $fin (- ?num1 ?num2)))
)