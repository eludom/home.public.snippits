# Move rows from one dataframe to another
# https://stackoverflow.com/questions/36142959/pandas-move-rows-from-1-df-to-another-df#36143395

import pandas as pd

data = {'Name':['Tom', 'nick', 'krish', 'jack'], 'Age':[20, 21, 19, 18]}
df = pd.DataFrame(data)

df_from = df.copy()
df_to = pd.DataFrame()

def move(a,b,cond):

    rows = a.loc[cond, :]

    # b.append acts like pass-by-value, parent not affected
    b = b.append(rows, ignore_index=True)

    # a.drop acts like pass-by-reference, parent affected
    a.drop(rows.index, inplace=True)
    return b

    # return local copy so it can be assigned in parent
    return(b)

df_to = move(df_from,df_to,df_from.Name == "Tom")
df_to = move(df_from,df_to,df_from.Name == "nick")
print("AFTER")
print(f"df_from is {df_from}")
print(f"df_to is {df_to}")
print()

