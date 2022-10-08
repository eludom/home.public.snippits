#! /usr/bin/env python3
# Read a CSV file and ignore comments

import pandas as pd

df = pd.read_csv("foo.csv",comment='#')
print(df)
