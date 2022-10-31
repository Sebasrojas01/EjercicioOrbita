from math import sqrt


class PLanet(object):
  cdef double x = 1.0, y = 0.0,  z = 1.0, xv = 0.0, vy = 0.0, vz = 0.0
  def __init__(self):
    # Some initial position and velocity
    self.x = 1.0
    self.y = 0.0
    self.z = 0.0
    self.vx = 0.0
    self.vy = 0.0
    self.vz = 0.0

    #Some mass
    self.m = 1.0



def single_step(planet, dt):
  """MAke single time step"""

  #Compute force: gravity towards origin
  distance = sqrt(planet.x**2 + planet.y**2 + planet.z**2)
  Fx = -planet.x / distance**3
  Fy = -planet.y / distance**3
  Fz = -planet.z / distance**3

def step_time(planet, time_span, n_steps):
  """Make a number of time steps forward"""

  dt = time_span / n_steps

  for j in range(n_steps):
    single_step(planet, dt)    