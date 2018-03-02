import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.getcwd())))
from funcs.GetKeyByTime import getXNandXQ
xn,xq =getXNandXQ()
print(xn,xq)
