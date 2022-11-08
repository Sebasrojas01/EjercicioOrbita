# Computación Paralela y Distribuida
## Medida de rendimiento Cython/Python: Problema Planeta en Orbita
- **Ingeniero a Cargo:** Juan Sebastian Rojas Acevedo


Python es un lenguaje de programación muy utilizado hoy en día, entre otras razones por que es cómodo para programar a alto nivel, tiene muchas librerías y es un código fácilmente mantenible. A pesar de todas estas ventajas, cabe destacar que es notoriamente lento, por lo que es conveniente conocer algunas herramientas que permitan acelerar el código Python.

Cython es un lenguaje que se escribe de forma muy similar a Python, pero permite la utilización de librerías y variables de tipo C. Por tanto, se puede conseguir la velocidad de C manteniendo la simplicidad de sintaxis proporcionada por Python. Además, una de sus grandes versatilidades es que se pueden mezclar definiciones explícitas de variables C con variables de Python, como pueden ser los diccionarios.

Sin embargo, programar en Cython también comporta una serie de inconvenientes, como la necesidad de compilar el código por separado antes de ejecutar el programa. También está el hecho de que comparado con lenguajes como C o Fortran, no tiene un soporte tan bueno para la paralelización de memoria.
