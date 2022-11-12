#! /usr/bin/env python

"""
expired - check for expired domain names

By default, take a domain name on the command line.

Print expiration date.

exit 0 none of the domains is expired

exit 1 any of the domains is expired

Usage:

        expired [--all] [--help] [options]  domain


"""
# >>> import whois


import whois
import optparse
import sys
from dateutil import parser
from datetime import date
from datetime import datetime

__author__ = 'George Jones'
__maintainer__ = 'George Jones'
__email__ = 'gmj@pobox.com'
__version__ = '0.0.1'

#
# whois
#

def p_error(msg=None):
    optp.print_help()
    if msg:
        optp.error(msg)
    sys.exit(1)

def parse_args(argv):
    global optp
    usage = """
        %prog [--all] [options]  name [name...]
        """

    # Parse arguments.
    optp = optparse.OptionParser(description=__doc__.strip(), version=__version__,
                             usage=usage)

    # Parse arguments
    (opts, args) = optp.parse_args()

    return opts, args

def main():
    global opts
    opts, args = parse_args(sys.argv)

    # Check for conflicting options here

    if len(args) == 0:
        p_error('Must supply at least one domain name')


    # today = parser.parse("2010/01/01")

    today = datetime.today()#.strftime('%Y-%m-%d')


    any_expired = False

    for arg in args:

        domain = whois.query(arg)
        dict = domain.__dict__

        for key in dict.keys():
            value = dict[key]
            t = type(value)
            #print(f"{key}: {value} : {t}"  )

            if dict["expiration_date"] < today:
                print(dict["name"] + " expired")
                any_expired = True
            else:
                print(dict["name"] + " not expired")

            break

    if any_expired:
        sys.exit(1)
    else:
        sys.exit(0)

if __name__ == '__main__':
    main()
