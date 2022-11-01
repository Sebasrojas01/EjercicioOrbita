#cython: lenguaje_level=3
"""
Se requiere la raiz cuadrada:
    Se instala como funcion externa
    SE prepara para multihilo
"""
cimport cython

cdef extern from "math.h":
    double sqrt(double x) nogil

cdef class Planet(object):
#Variables publicas declaracion

    cdef public float x,y,z,vx,vy,vz,m
    def __init__(self):
        #some initial position and velocity
        self.x = 1.0
        self.y = 0.0
        self.z = 0.0
        self.vx = 0.0
        self.vy = 0.5
        self.vz = 0.0

        # doublesome mass
        self.m=1.0

"""
Puede ser la distancia 0
Para evitar lo anterior preparamos una alerta basada
en cython: cdivision(True/False)
    Al poner True, invalida la instruccion 
    al saltar la bandera (INF)
    
Se prepara con un decorador de cython
"""

@cython.cdivision(True)
cdef void single_step(Planet planet,double dt) nogil:

    cdef double distance, Fx, Fy, Fz

    """Make a single time step"""
    #Compute force: gravity towards origin
    distance = sqrt(planet.x**2 + planet.y**2 + planet.z**2)
    Fx = -planet.x/distance**3
    Fy = -planet.y/distance**3
    Fz = -planet.z/distance**3

    #Time step position, according to velocity
    planet.x += dt * planet.vx
    planet.y += dt * planet.vy
    planet.z += dt * planet.vz

    #Time step velocity, according to force and mass
    
def step_time(Planet planet, double time_span, int n_steps):
    cdef double dt
    cdef int j
    dt = time_span / n_steps

    """Make a number of time steps forward"""
    
    """
    Se prepara para el paralelismo
    """

    with nogil:
        for j in range (n_steps):
            single_step(planet, dt)

