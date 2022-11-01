import orbita_cy
import orbita_py
import time

#SE inicializa el planeta en python
tierra_py = orbita_py.Planet()
tierra_py.x = 100*10*3
tierra_py.y = 300*10*3
tierra_py.z = 700*10*3
tierra_py.vx = 2.00*10*3
tierra_py.vy = 29.87*10*3
tierra_py.vz = 0.034*10*3
tierra_py.m = 5.9742*10*3

#SE inicializa el planeta en cython
tierra_cy = orbita_cy.Planet()
tierra_cy.x = 100*10*3
tierra_cy.y = 300*10*3
tierra_cy.z = 700*10*3
tierra_cy.vx = 2.00*10*3
tierra_cy.vy = 29.87*10*3
tierra_cy.vz = 0.034*10*3
tierra_cy.m = 5.9742*10*3

#Se consideran las otras variables
time_span = 400
n_steps = 2000000

#Definicion de experimentos 
#Reduccion 

formato_datos ="-- {:.0f}\n -- {:.1f}\n"

for i in range(2):

    ini_time = time.time()
    orbita_cy.step_time(tierra_cy, time_span, n_steps)
    fin_time = time.time()

    time_cython = fin_time-ini_time

    ini_time = time.time()
    orbita_py.step_time(tierra_py, time_span, n_steps)
    fin_time = time.time()

    time_python = fin_time-ini_time

#Se crea un formato 

  

    with open("planeta.csv", "w")as archivo:
        archivo.write(formato_datos.format(i, time_python, time_cython))

    print("Cython Time: ",time_cython)
    print("Python Time: ",time_python)

    print("Cython es: ",time_python/time_cython," mas rapido\n")