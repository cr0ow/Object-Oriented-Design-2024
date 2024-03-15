#!/bin/bash

fpc Lab1Procedures.pas > /dev/null 2>&1
fpc -olab1main.x Lab1Main.pas > /dev/null 2>&1
./lab1main.x

fpc -olab1tests.x Lab1Tests.pas > /dev/null 2>&1
./olab1tests.x

rm -rf *.o *.x *.ppu