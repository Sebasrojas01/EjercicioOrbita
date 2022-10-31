import orbita
import fib_py
import time

ini_time =time.time()
fib_cy.fib_cy(555)
fin_time = time.time() 

time_cython = fin_time - ini_time

ini_time =time.time()
fib_py.fib_py(555)
fin_time = time.time() 

time_python = fin_time - ini_time

print("EL tiempo de Cython es: ",time_cython, "seg")
print("EL tiempo de Python es: ",time_python, "seg \n")



print("Cython es ",time_cython / time_python," mas rapido")