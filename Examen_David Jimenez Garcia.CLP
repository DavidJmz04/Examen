(deffacts datos
	(lista 5 3 8 7 14 suma 0 resta 0 mult 0 div 0 pasos)
	(numero 21)
)

(defrule acaba
	(lista ?numero suma ?suma resta ?resta mult ?mult div ?div pasos $?pasos)
	(numero ?numero)
	(test(<> ?suma 0))
	(test(<> ?resta 0))
	(test(<> ?mult 0))
	(test(<> ?div 0))
=>
	(printout t crlf "Ya he encontrado el numero: "  $?numero " siguiendo el camino: " $?pasos crlf)
	(halt)
)

(defrule division
	(lista $?ini ?num1 $?aux ?num2 $?fin suma ?suma resta ?resta mult ?mult div ?div pasos $?pasos)
	(test(= (mod ?num1 ?num2) 0))
=>
	(assert(lista $?ini $?aux $?fin (div ?num1 ?num2) suma ?suma resta ?resta mult ?mult div (+ ?div 1) pasos $?pasos ?num1 / ?num2 ,))
)

(defrule multiplicacion
	(lista $?ini ?num1 $?aux ?num2 $?fin suma ?suma resta ?resta mult ?mult div ?div pasos $?pasos)
=>
	(assert(lista $?ini $?aux $?fin (* ?num1 ?num2) suma ?suma resta ?resta mult (+ ?mult 1) div ?div pasos $?pasos ?num1 * ?num2 ,))
)

(defrule suma
	(lista $?ini ?num1 $?aux ?num2 $?fin suma ?suma resta ?resta mult ?mult div ?div pasos $?pasos)
=>
	(assert(lista $?ini $?aux $?fin (+ ?num1 ?num2) suma (+ ?suma 1) resta ?resta mult ?mult div ?div pasos $?pasos ?num1 + ?num2 ,))
)

(defrule resta
	(lista $?ini ?num1 $?aux ?num2 $?fin suma ?suma resta ?resta mult ?mult div ?div pasos $?pasos)
	(test(> ?num1 ?num2))
=>
	(assert(lista $?ini $?aux $?fin (- ?num1 ?num2) suma ?suma resta (+ ?resta 1) mult ?mult div ?div pasos $?pasos ?num1 - ?num2 ,))
)