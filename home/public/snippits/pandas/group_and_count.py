#! /usr/bin/env python3
# playing with group and count

# https://stackoverflow.com/questions/38174155/group-dataframe-and-get-sum-and-count


import pandas as pd
data = {
    'Company' : ['Ford','Ford','Ford','Ford','Chevy','Chevy'],
    'Type' : ['Mercury','Lincoln','Lincoln','Econoline','Malabu','Pickups'],
    'Profit' : [1,100,40,99,2,3]
}
df = pd.DataFrame(data)

# Want to compute mean and std of Profit
# Add duplicates of value to be aggrigated
df['mean_profit'] = df["Profit"]
df['std_profit'] = df["Profit"]

df2 = df.groupby('Company').agg({'Type':'count','Profit':'sum', 'mean_profit':'mean','std_profit':'std'}).reset_index().rename(columns={'Type':"count"})
print(df2)

#   Company  count  Profit  mean_profit  std_profit
# 0   Chevy      2       5          2.5    0.707107
# 1    Ford      4     240         60.0   48.311489
