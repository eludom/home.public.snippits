# Drop duplicates in pandas dataframe

# https://datatofish.com/remove-duplicates-pandas-dataframe/
import pandas as pd

boxes = {'Color': ['Green','Green','Green','Blue','Blue','Red','Red','Red'],
         'Shape': ['Rectangle','Rectangle','Square','Rectangle','Square','Square','Square','Rectangle']
        }
df = pd.DataFrame(boxes, columns = ['Color', 'Shape'])
print("")
print(df)
print(f"Row count: {len(df)}")

print("Dropping Duplicats")
df.drop_duplicates(inplace=True)
print("")
print(df)
print(f"Row count: {len(df)}")
