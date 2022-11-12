# Getting dates as a string

from datetime import date, timedelta

def days_ago_string(days_ago: int = 0) -> str:
  day = date.today() - timedelta(days=days_ago)
  print(day)
  return day.strftime('%Y-%m-%d')


days_ago_string()
