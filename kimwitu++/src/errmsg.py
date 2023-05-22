#! /usr/bin/env python
# 
#  The Termprocessor Kimwitu++
#
#  Copyright (C) 1998-2007 Humboldt-Universität zu Berlin, Institute of Informatics
#  All rights reserved.
#  
# Kimwitu++ is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# Kimwitu++ is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Kimwitu++; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA
#  
"""
This program parses the verbose bison output in order to extract the states
and their corresponding rules. For example, the snippet
state 328

  303 ac_declarator: ac_pointer ac_direct_declarator .
  314 ac_direct_declarator: ac_direct_declarator . '[' ac_constant_expression_option ']'
  315                     | ac_direct_declarator . '(' ac_parameter_type_list ')'

is translated to two C arrays 

int error_rules[][2], error_state[];

These arrays, can be used for error reporting in the generated bison parser.
Using the arrays yyrhs and yyr1, the complete text of a rule can be
reproduced. The only missing information is the association between (state,
(rule number, position of the dot)); it is provided by the aforementioned
arrays.

error_state gives, for a state, the index into error_rules, which,
starting at that index and terminated by {0,0} provides all rule
numbers and dot positions.

This program is invoked with the name of the bison output foo.output.
It then generates a file foo-output.c

The following assumptions are made about the input:
- the individual state listings start at column 0 with "state"
- the rules inside a state have a ":" and start with <rule number>
"""

import sys,string,os,re

def usage():
    print "Usage:%s Y.OUTPUT ERRMSG.C" % sys.argv[0]
    sys.exit(1)


args = sys.argv[1:]

if len(args)!=2:
    print "too many arguments", args
    usage()

base,ext=os.path.splitext(args[0])
if ext!=".output":
    print args[0],"does not end in .output"
    usage()

states = {}
curstate=None

for l in open(args[0],"rt").readlines():
    if l[:6]=="state " and l[6] in string.digits:
        curstate = int(l[6:])
        states[curstate]=[]
        continue
    if curstate is None:
        # we have not seen state 0, yet
        continue
    if l.find(": ") == -1 and l.find("| ") == -1:
        # inside a state, but this line is not a rule
        continue
    if l.find("error")!=-1:
        # this is an error stabilization rule
        continue
    # Now we have a rule. Split off the rule
    l = l.strip()
    ruleno, l = int(l[:l.find(" ")]), l[l.find(" "):]
    # the rule might contain funny characters. Not all are supported, here.
    
    # Recent bison versions have correct C characters, but we need strings
    l=re.sub('"','\\"',l)
    
    l = l.split()
    # The first field may look like "rule:" or "|" now;
    # in both cases, we ignore it
    assert l[0] == "|" or l[0][-1:] == ":"
    l = l[1:]
    try:
        # A single character ' ' might have been split into two tokens
        pos = l.index("'")
        assert l[pos+1] == "'"
	# Don't really repair since we do not care for the actual value
        del l[pos]
    except ValueError:
        pass
    pos = 0
    for token in l:
        if token == ".":
            break
        pos += 1
    states[curstate].append((ruleno, pos))

out=open(args[1],"w")

errstate = []
pos = 0
out.write("int const error_rules[][2]={\n")
for i in xrange(0, max(states.keys())+1):
    errstate.append(pos)
    for r in states.get(i, [])+[(0,0)]:
	out.write(" {%4d, %2d}," % r)
	if pos % 6 == 5:
	    out.write("\n")
	pos += 1
out.write(" {   0,  0}\n};\n\n")
out.write("int error_state[]={\n")
for i in range(len(errstate)):
    out.write("%5d," % errstate[i])
    if i % 8 == 7:
	out.write("\n")
out.write(" 0\n};\n")
    

out.close()
    
