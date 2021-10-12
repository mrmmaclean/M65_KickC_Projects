#!/bin/sh
# @echo off

WRITE="c1541 -attach $PWD/bin/DISK.D81 8 -write"
FORMAT="c1541 -format disk,0 d81 $PWD/bin/DISK.D81"
KICKASM="java -cp /Users/mawkul/Documents/dev/kickass.jar kickass.KickAssembler65CE02  -vicesymbols -showmem"
# set DEPLOY="C:\C64\Tools\m65_connect\M65Connect Resources\m65.exe" -l COM6 -F -r 

# ASSETS
node ../_include/aseparse65/asp65 sprites -i ./assets/sprite.aseprite -d -p -o ./assets/sprites -s 2

echo ASSEMBLING SOURCES...
$KICKASM  main.s -odir ./bin

echo CREATING DISK IMAGE AND BOOT PRG...
$FORMAT
$WRITE $PWD/bin/main.prg main

echo DEPLOYING...
# $DEPLOY "./bin/main.prg"
/Applications/xmega65.app/Contents/MacOS/xmega65 -besure -prg "./bin/main.prg"


