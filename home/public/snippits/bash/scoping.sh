#! /bin/bash
# explore/demonstrate scoping in bash

unset FOO

#
# Testing scoping of variables to/from functions
#


# Q: Do functions inherit variables from outer scope?
#
FOO=FOO-outside
function baz { echo FOO is $FOO; }
baz
# output is "FOO-outside".
#
# A: yes.  $FOO comes from outer scope

# Q: when does variable expansion happen
#
FOO=FOO-outside2
baz
# output is "FOO-outside2"
#
# A: expansion of $FOO hapens at baz runtime, not when defined.

# Q: are variables global?
#
function blort { FOO=foo-inside; echo FOO inside is $FOO; }
echo $FOO
# FOO is "inside before calling the function"
blort
# ouput is "FOO inside is foo-inside"
echo $FOO
# output is "foo-inside"
#
# A: scope of of variableis global

#
# Exporting variables to subshells
#
$ export -p | grep FOO
$ # FOO is not exported

$ FOO=bar
$ export -p | grep FOO
$ # FOO is still not exported

$ export FOO=baz
$ export -p | grep FOO
declare -x FOO="baz"
# Q: but as we see below, non-exported variables are
#    inherited by subproceses (probably as a conseuqence
#    of fork(2).  When are exports neeed?


#
# Testing scoping of varibles in subshells
#

# Q: are variable in a sub-shell local to that shell?
unset FOO
FOO=bar
function blort {
    (
        echo FOO inside blort is $FOO;
        FOO=foo-inside;
        echo FOO inside blort is $FOO after setting
    )
}
blort
echo FOO outside blort after call to baz is $FOO
# A: yes. FOO did not change outside the function.
#
# Commentary.  This seems like a "safe" way to
#   lmit namespace pollution and side-effects in bash,
#   as long as you don't find the fork/exec overhead.
