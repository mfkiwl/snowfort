#!/bin/bash

source ./test.cfg

if [ "$1" = "make" ]; then
	cp quiterdc.h $CONTIKI_HOME/core/net/mac/quiterdc.h
	cp Makefile.mac $CONTIKI_HOME/core/net/mac/Makefile.mac
	cp quiterdc.c $CONTIKI_HOME/core/net/mac/quiterdc.c

	make nullApp.upload MOTE=1 BASH_CONST=-DSN_ID=$2
fi

if [ "$1" = "test" ]; then
	cp quiterdc.h $CONTIKI_HOME/core/net/mac/quiterdc.h
	cp Makefile.mac $CONTIKI_HOME/core/net/mac/Makefile.mac
	cp quiterdc.c $CONTIKI_HOME/core/net/mac/quiterdc.c

	make nullApp.mspsim MOTE=1 BASH_CONST=-DSN_ID=$2
fi

if [ "$1" = "login" ]; then
	make login MOTE=1 | tee log_ap.txt
fi
