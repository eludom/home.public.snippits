#! /usr/bin/env python
# Date manipulation examples

# https://datagy.io/python-string-to-date/
# https://stackoverflow.com/questions/12566152/python-x-days-ago-to-datetime

from datetime import datetime
from dateutil.relativedelta import relativedelta


date_string = '2021-12-31'
then = datetime.strptime(date_string, '%Y-%m-%d')
print(f"then: {then}")

now = datetime.now()
print(f"now: {now}")

diff = now - then
print(diff)

# minus 1 year

oneYearAgoDate = datetime.now() - relativedelta(years=1)
oneYearAgoString = oneYearAgoDate.strftime('%Y-%m-%d')

print(oneYearAgoString)
