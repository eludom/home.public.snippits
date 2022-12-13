#! /usr/bin/env python3
# Read a CSV file and plot it
#
# https://stackoverflow.com/questions/40071096/how-to-plot-multiple-lines-in-one-figure-in-pandas-python-based-on-data-from-mul

import pandas as pd
import matplotlib.pyplot as plt
from io import StringIO

# CSV String with out headers
csvString = """name,date,income
Barny,1998-01-01,100
Barny,1999-01-01,120
Barny,2000-01-01,130
Fred,1998-01-01,200
Fred,1999-01-01,99
Fred,2000-01-01,110
Wilma,1996-01-01,20
Wilma,1997-01-01,50
Wilma,1998-01-01,55
Wilma,1999-01-01,40
"""

# Convert String into StringIO
csvStringIO = StringIO(csvString)
# Load CSV String into DataFrame
df = pd.read_csv(csvStringIO, sep=",")
df.sort_values("date",inplace=True)
print(df)

fig,ax = plt.subplots()

for name in list(list(set(df['name']))):
    ax.plot(df[df.name==name].date,df[df.name==name].income,label=name)

ax.set_xlabel("date")
ax.set_ylabel("income")
ax.legend(loc='best')

plt.show()
