#!/usr/bin/env python

import sys
import time
import numpy as np
import pandas as pd
import sklearn as skl

while True:
    print('Tick...', end=' ')
    sys.stdout.flush()
    time.sleep(2)
    print('Tock.')
    sys.stdout.flush()
    time.sleep(1)
