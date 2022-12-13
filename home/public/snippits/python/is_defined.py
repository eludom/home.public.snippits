del foo

try:
    print(f"Take 1: foo is defined, value {foo}")
except NameError:
    print("Take 1: foo isn't defined")
    foo="foo"

try:
    print(f"Take 2: foo is defined, value {foo}")
except NameError:
    print("Take 2: foo isn't defined")
    foo="foo"
