#!/usr/bin/env python3

import sys
from collections import namedtuple

kraken_report, output = sys.argv[1:]

KrakenLine = namedtuple('KrakenLine', [
    'percentage',
    'covered',
    'assigned',
    'rank',
    'taxid',
    'sciname',
    'indentation',
    'has_children',
])

stack = []
with open(kraken_report) as inf:
    with open(output, "w") as outf:
        def active_species(leaf_sciname):
            for kraken_line in stack:
                yield kraken_line.sciname
            yield leaf_sciname
        
        def emitRecord(kraken_line):
            if kraken_line.has_children:
                return

            print("%s\t%s" % (
                kraken_line.taxid,
                "::".join(active_species(kraken_line.sciname))))
        
        for line in inf:
            (percentage,
             covered,
             assigned,
             rank,
             taxid,
             sciname) = line.strip().split("\t", 5)

            indentation = (len(sciname) - len(sciname.strip())) // 2
            sciname = sciname.strip()

            if stack and stack[-1].indentation < indentation:
                stack[-1] = stack[-1]._replace(has_children=True)
            
            while stack and stack[-1].indentation >= indentation:
                emitRecord(stack.pop())
            
            stack.append(KrakenLine(
                percentage,
                covered,
                assigned,
                rank,
                taxid,
                sciname,
                indentation,
                has_children=False))
        while stack:
            emitRecord(stack.pop())
