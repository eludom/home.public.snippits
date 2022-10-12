#! /usr/bin/env python3
# Write and read json files
#
# See https://www.geeksforgeeks.org/reading-and-writing-json-to-a-file-in-python/
#

import json

# make a random dictionary
foo_dict={}
foo_dict["bar"] = "A bar"
foo_dict["baz"] = "A baz"

print(f"foo_dict: {foo_dict}")

# create json a string
foo_json = json.dumps(foo_dict,indent=4)

print(f"foo_json: {foo_json}")

# save it to a file
with open("sample.json", "w") as outfile:
    outfile.write(foo_json)

# read it back
with open('sample.json', 'r') as openfile:
    bar_json = json.load(openfile)
 
print(f"bar_json: {bar_json}")
