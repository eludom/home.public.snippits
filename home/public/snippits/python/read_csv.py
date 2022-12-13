#! /usr/bin/env python
# Sample of reading a CSV file
#
# https://stackoverflow.com/questions/41585078/how-do-i-read-and-write-csv-files-with-python
#

import csv

# # Define data
# data = [
#     (1, "A towel,", 1.0),
#     (42, " it says, ", 2.0),
#     (1337, "is about the most ", -1),
#     (0, "massively useful thing ", 123),
#     (-2, "an interstellar hitchhiker can have.", 3),
# ]

# # Write CSV file
# with open("test.csv", "wt") as fp:
#     writer = csv.writer(fp, delimiter=",")
#     # writer.writerow(["your", "header", "foo"])  # write header
#     writer.writerows(data)

# Read CSV file

for file in files:
    with open(file) as fp:
        reader = csv.reader(fp, delimiter=",", quotechar='"')
        # next(reader, None)  # skip the headers
        # data_read = [row for row in reader]

        # print(data_read)

        lineno = 0
        num_column_headrs = 0
        print_first_n = 5

        for row in reader:
            lineno += 1

            if lineno == 1:
                num_column_headers = len(row)

            len_row = len(row)
            if len_row != num_column_headers:
                sys.stderr.write(f"Bad coumn count: line {lineno} has {len_row} colums.  Expecting {num_column_headers}\n")
                print(row)
                sys.exit()

            if lineno <= print_first_n:
                print(row)

            if lineno > MAXLINES:
                break

        sys.stderr.write(f"Done: read {lineno} lines.\n")
