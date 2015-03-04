#!/usr/bin/env python
# -*- coding: utf-8 -*-

from collections import defaultdict

import os
import sys

dist = defaultdict(int)

def main():
  with open('../raw/all_batch_sizes.tsv') as f:
    next(f)
    for line in f:
    	timestamp, hits_available, hit_group = line.strip().split('\t')
    	dist[hits_available] += 1


if __name__ == '__main__':
  main()
  for hits_available, num in dist.items():
    print hits_available + ',' + str(num)

