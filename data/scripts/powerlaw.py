#!/usr/bin/env python
# -*- coding: utf-8 -*-

from collections import defaultdict

import os
import sys

dist = {'2009': defaultdict(int),
    '2010': defaultdict(int),
    '2011': defaultdict(int),
    '2012': defaultdict(int),
    '2013': defaultdict(int),
    '2014': defaultdict(int)
}

def main():
  with open('../raw/all_batch_sizes.tsv') as f:
    next(f)
    for line in f:
      timestamp, hits_available, hit_group = line.strip().split('\t')
      year = timestamp[6:]
      dist[year][hits_available] += 1


if __name__ == '__main__':
  main()
  for year, values in dist.items():
    for hits_available, num in values.items():
      print year + ',' + hits_available + ',' + str(num)

