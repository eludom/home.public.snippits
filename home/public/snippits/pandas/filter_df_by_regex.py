#! /usr/bin/env python3
# filter dataframe by matching regex

# https://stackoverflow.com/questions/37080612/pandas-dataframe-filter-regex/37080814#37080814

import pandas as pd
data = {
    'Company' : ['Ford','Ford','Ford','Ford','Chevy','Chevy'],
    'Type' : ['Mercury','Lincoln','Lincoln','Econoline','Malabu','Pickups'],
    'Profit' : [1,100,40,99,2,3]
}
df = pd.DataFrame(data)

# print(df)

#   Company       Type  Profit
# 0    Ford    Mercury       1
# 1    Ford    Lincoln     100
# 2    Ford    Lincoln      40
# 3    Ford  Econoline      99
# 4   Chevy     Malabu       2
# 5   Chevy    Pickups       3

# Now print only rows that have an "e" in the Type
# preceeded by a capitol letter or has a "u"
#
# That's how I choose# my cars :-)

print(df[df["Type"].str.contains('[A-Z]e|u',regex=True)])
