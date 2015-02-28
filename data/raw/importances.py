#!/usr/bin/env python
# -*- coding: utf-8 -*-


from collections import Counter

import pandas as pd
from pandas import DataFrame
from pandas.stats.api import ols

import sys
import time


def results_loader(filename):
  records = []
  with open(filename) as f:
    firstline = f.readline()
    labels = firstline.strip().replace('"','').split(',')[1:]
    for line in f:
      record = line.strip().replace('"','').split(',')[1:]
      record = [float(x) for x in record]
      records.append(dict(zip(labels, record)))

  return DataFrame.from_records(records)


if __name__ == '__main__':
  dataframe = results_loader('importances.csv')
  dataframe = dataframe.reindex_axis(dataframe.mean().order(ascending=False).index, axis=1)
  print dataframe.mean()*100
  print dataframe.std()*100
  for key in dataframe.keys():
    print key
    print pd.ols(y=dataframe[key]*100, x=pd.Series(range(len(dataframe.index)))).beta


