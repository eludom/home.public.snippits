#! /usr/bin/env python
# Read a list of files, parse dates out of filenames

import sys
import re
from datetime import datetime
from dateutil import parser

# Example format for the filename: "file_2022-01-01.txt"
# date_format = "%Y-%m-%d"

# date_pattern = re.compile(r"(\d{4}-\d{2}-\d{2})")

# Read filenames from standard input
lines = sys.stdin.read().splitlines()

for line in lines:
    # Extract all dates from the text

    try:
        res = parser.parse(line, fuzzy=True)
        print(f"res {res} in {line}")
    except:
        pass
        # print(f"No date in: {line}")

    # dates = re.findall(date_pattern, line)

    # if dates:
    #     for date in dates:
    #         print(f"date {date}, line: {line}")

# # Parse the dates from each filename and convert to datetime objects
# dates = [datetime.strptime(f.split("_")[1].split(".")[0], date_format) for f in filenames]

# # Print the filename with its corresponding date
# for filename, date in zip(filenames, dates):
#     print(f"{filename}: {date}")
