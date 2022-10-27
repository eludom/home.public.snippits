#! /usr/bin/env python
# Simple regex examples

import re

foo="The foo in bar falls in Maine, mainly"

if re.search("foo",foo):
    print(f"'foo' is in {foo}")
else:
    print(f"'foo' is NOT in {foo}")

if re.search("bar",foo):
    print(f"'bar' is in {foo}")
else:
    print(f"'bar' is NOT in {foo}")


if re.search("^The",foo):
    print(f"'The' is at the start of {foo}")
else:
    print(f"'The' is NOT at the start of {foo}")
