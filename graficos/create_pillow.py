from matplotlib.animation import PillowWriter
import matplotlib.pyplot as plt
from math import sin
import numpy as np

seno = lambda x: sin(x)
xList = list(np.linspace(-5, 5, 100))
yList = [seno(xVal) for xVal in xList]

def make_pillow(fps:int, fig):
    print("entrou na func")
   # fig = plt.figure()
    l, = plt.plot([], [], 'k-')
    plt.xlim(-5, 5)
    plt.ylim(-1, 1)
    currentXList: list = []
    currentYList: list  =[]
    writer = PillowWriter(fps=fps)
    with writer.saving(fig,"teste.gif",100):
        for xVal, yVal in zip(xList, yList):
        # You can just append the value here since it's already pre-calculated.
         currentXList.append(xVal)
         currentYList.append(yVal)
         plt.draw()
         l.set_data(currentXList, currentYList)
         writer.grab_frame()

#fig = plt.figure()
#make_pillow(15,fig)