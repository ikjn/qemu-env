#!/bin/bash
a=0

make install -j4 && \
while [ "$a" -eq 0 ] ; do telnet localhost 4567 && a=1 ; done
