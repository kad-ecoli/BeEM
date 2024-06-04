CC=g++
CFLAGS=-O3
LDFLAGS=#-static

all: BeEM cifte

BeEM: BeEM.cpp
	${CC} ${CFLAGS} $@.cpp -o $@ ${LDFLAGS}

cifte: cifte.cpp
	${CC} ${CFLAGS} $@.cpp -o $@ ${LDFLAGS}
