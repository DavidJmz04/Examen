(deffacts datos
	(lista 5 3 8 14 7 pasos)
	(numero 21)
)

(defrule acaba
	(lista $?ini ?numero $?fin pasos $?pasos)
	(numero ?numero)
=>
	(printout t crlf "Ya he encontrado el numero: "  $?numero ", siguiendo los pasos: " $?pasos crlf)
	(halt)
)

(defrule division
	(lista $?ini ?num1 $?aux ?num2 $?fin)
	(test(= (mod ?num1 ?num2) 0))
=>
	(assert(lista $?ini $?aux $?fin (div ?num1 ?num2) pasos $?pasos))
)

(defrule suma
	(lista $?ini ?num1 $?aux ?num2 $?fin)
=>
	(assert(lista $?ini $?aux $?fin (+ ?num1 ?num2) pasos $?pasos))
)

(defrule resta
	(lista $?ini ?num1 $?aux ?num2 $?fin)
	(test(> ?num1 ?num2))
=>
	(assert(lista $?ini $?aux $?fin (- ?num1 ?num2) pasos $?pasos))
)

(defrule multiplicacion
	(lista $?ini ?num1 $?aux ?num2 $?fin)
=>
	(assert(lista $?ini $?aux $?fin (* ?num1 ?num2) pasos $?pasos))
)

