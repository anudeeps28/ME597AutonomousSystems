#!/usr/bin/env python
import numpy as np


class PidController:
    # tracking P,I and D(proportional, integral and derivative) terms in the PID controller
    def __init__(self, kp, ki, kd, dt, outmin=-1, outmax=1): 
        self.err = 0 # previous error
        self.integ = 0
        self.kp = kp
        self.ki = ki
        self.kd = kd
        self.dt = dt
        self.outmax = outmax
        self.outmin = outmin

    def step(self, err):

        deriv = (err - self.err) / self.dt # derivative term
        integ = self.integ + err * self.dt # integral sum 

        out = self.kp * err + self.ki * integ + self.kd * deriv # PID Control Law

        # clipping function
        out = np.clip(out, self.outmin, self.outmax) # this is done to keep the function in bounds of maximum and minimum limits

        self.err = err # storing accumalted error

        self.integ = integ # storing accumatled integer sum 

        # giving output speed after error correction
        return(out) 
