#!/bin/sh
# encoding: utf-8
from __future__ import print_function
''''which python2 >/dev/null 2>&1 && exec python2 "$0" "$@" # '''
''''which python  >/dev/null 2>&1 && exec python  "$0" "$@" # '''
''''exec echo "Error: I can't find python anywhere"         # '''
# Author: Tim Pulver
# Date: 2015
# https://github.com/timpulver/todo.txt-graph
#
# Visualizes the completed tasks in todo.txt with horizontal bar graphs
# Items are coloured green when there are more than 5 completed tasks per day,
# grey otherwise to motivate completing stuff.
# Have a look at Jerry Seinfeld's "Don't break the chain" methodoligy:
# https://dontbreakthechain.com/what
# You can change the threshold by adding this line to your todo.cfg file:
# export TODOTXT_GRAPH_THRESHOLD=123
#
# Params:
#   - TODO_TXT_PATH: Where the todo.txt / done.txt file is located
#   - NUMBER_OF_DAYS: How many days should be visualized (optional, default: 7)

import datetime
import sys
import os
import re
import collections

TICK_CHAR = '■'
DEFAULT_THRESHOLD = 5 # grey bar < DEFAULT_THRESHOLD >= green bar
WIDTH = 60 # Graph width
DONE = "done.txt"

# try to use xrange, which is faster
try:
    range = xrange
except NameError:
    pass



# Bash color codes and color helper class from:
# https://github.com/emilerl/emilerl/blob/master/pybash/bash/__init__.py
RESET = '\033[0m'
CCODES = {
    'black'           :'\033[0;30m',
    'blue'            :'\033[0;34m',
    'green'           :'\033[0;32m',
    'cyan'            :'\033[0;36m',
    'red'             :'\033[0;31m',
    'purple'          :'\033[0;35m',
    'brown'           :'\033[0;33m',
    'light_gray'      :'\033[0;37m',
    'dark_gray'       :'\033[0;30m',
    'light_blue'      :'\033[0;34m',
    'light_green'     :'\033[0;32m',
    'light_cyan'      :'\033[0;36m',
    'light_red'       :'\033[0;31m',
    'light_purple'    :'\033[0;35m',
    'yellow'          :'\033[0;33m',
    'white'           :'\033[0;37m',
}

# A helper class to colorize strings
class Colors(object):
    def __init__(self, state = False):
        self.disabled = state

    def disable(self):
        self.disabled = True

    def enable(self):
        self.disabled = False

    def __getattr__(self,key):
        if key not in CCODES.keys():
            raise AttributeError, "Colors object has no attribute '%s'" % key
        else:
            if self.disabled:
                return lambda x: x
            else:
                return lambda x: RESET + CCODES[key] + x + RESET

    def __dir__(self):
        return self.__class__.__dict__.keys() + CCODES.keys()



# Graph based on:
# https://github.com/mkaz/termgraph/blob/master/termgraph.py
def print_blocks(label, count, step):
    blocks = int(count / step)
    print("{}: ".format(label), end="")
    threshold = int(os.getenv('TODOTXT_GRAPH_THRESHOLD', DEFAULT_THRESHOLD))

    c = Colors()

    for i in range(blocks):
        if count >= threshold:
            sys.stdout.write(c.green(TICK_CHAR))
        else:
            sys.stdout.write(c.light_gray(TICK_CHAR))

    # format the text (number of tasks done)
    if count < 10:
        print("{:>2.0f}".format(count))
    elif count < 100:
        print("{:>3.0f}".format(count))
    else:
        print("{:>4.0f}".format(count))


# Based on Lately Addon:
# https://github.com/emilerl/emilerl/tree/master/todo.actions.d
def main(directory, cutoffDays = 7):
    f = open(os.path.join(directory, DONE), 'r')
    lines = f.readlines()
    today = datetime.datetime.today()
    cutoff =  today - datetime.timedelta(days=cutoffDays)
    dic = {}

    for line in lines:
        m = re.match("x ([\d]{4}-[\d]{2}-[\d]{2}).*", line)
        if m is not None:
            done = m.group(1)
            year, month, day = m.group(1).split("-")
            completed = datetime.datetime(int(year),int(month),int(day))
            if completed >= cutoff:
                #print c.green(m.group(1)) + " " + c.blue(line.replace("x %s" % m.group(1), "").strip())
                if m.group(1) in dic:
                    oldVal = dic.get(m.group(1), 1)
                    dic.update({m.group(1): oldVal+1})
                else:
                    dic[m.group(1)] = 1

    # find out max value
    max = 0
    for key, value in dic.iteritems():
        if value > max:
            max = value

    maxf = float(max)
    step = maxf / WIDTH

    orderedDic = collections.OrderedDict(sorted(dic.items()))

    # display graph
    print()
    for key, value in orderedDic.iteritems():
        print_blocks(key, value, step)
    print()


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print("Usage: graph.py [TODO_DIR] <days back>")
        sys.exit(1)

    if os.path.isdir(sys.argv[1]):
        if len(sys.argv) is 3:
            main(sys.argv[1], int(sys.argv[2]))
        else:
            main(sys.argv[1])
    else:
        print("Error: %s is not a directory" % sys.argv[1])
        sys.exit(1)
