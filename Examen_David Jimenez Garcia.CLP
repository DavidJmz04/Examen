(deffacts datos
	(lista 5 3 8 14 7 pasos)
	(numero 15)
)

(defrule acaba
	(lista ?numero pasos $?pasos)
	(numero ?numero)
=>
	(printout t crlf "Ya he encontrado el numero: "  $?numero " siguiendo el camino: " $?pasos crlf)
	(halt)
)

(defrule division
	(lista $?ini ?num1 $?aux ?num2 $?fin pasos $?pasos)
	(test(= (mod ?num1 ?num2) 0))
=>
	(assert(lista $?ini $?aux $?fin (div ?num1 ?num2) pasos $?pasos ?num1 / ?num2 ,))
)

(defrule multiplicacion
	(lista $?ini ?num1 $?aux ?num2 $?fin pasos $?pasos)
=>
	(assert(lista $?ini $?aux $?fin (* ?num1 ?num2) pasos $?pasos ?num1 * ?num2 ,))
)

(defrule suma
	(lista $?ini ?num1 $?aux ?num2 $?fin pasos $?pasos)
=>
	(assert(lista $?ini $?aux $?fin (+ ?num1 ?num2) pasos $?pasos ?num1 + ?num2 ,))
)

(defrule resta
	(lista $?ini ?num1 $?aux ?num2 $?fin pasos $?pasos)
	(test(> ?num1 ?num2))
=>
	(assert(lista $?ini $?aux $?fin (- ?num1 ?num2) pasos $?pasos ?num1 - ?num2 ,))
)