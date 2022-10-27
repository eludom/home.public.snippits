#! /usr/bin/env python3
# Read a CSV file and ignore comments,  read everything as a string

import pandas as pd

df = pd.read_csv("foo.csv",comment='#',dtype=str)
print(df)
