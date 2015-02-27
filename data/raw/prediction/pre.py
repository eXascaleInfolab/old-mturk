import pickle
import matplotlib.pyplot as plt
import numpy as np
import pylab as pl
#predict = pickle.load( open( "/Users/xi/repositories/exascale-mturk/data/raw/predict.p", "rb" ) )
#test = pickle.load( open( "/Users/xi/repositories/exascale-mturk/data/raw/test.p", "rb" ) )
predict = pickle.load( open( "/Users/xi/Documents/misc_experiments/training_data/ML/predict.p", "rb" ) )
test = pickle.load( open( "/Users/xi/Documents/misc_experiments/training_data/ML/test.p", "rb" ) )
for i in range(0, len(test)):
    print test[i], predict[i]
