#!/bin/bash

fpc Lab1Procedures.pas > /dev/null 2>&1
fpc -olab1main.x Lab1Main.pas > /dev/null 2>&1
./lab1main.x

# fpc Lab1Tests.pas > /dev/null 2>&1
# fpc -olab1testsrunner.x Lab1TestsRunner.pas -dtest #> /dev/null 2>&1
# ./lab1testsrunner.x

rm -rf *.o *.x *.ppu
