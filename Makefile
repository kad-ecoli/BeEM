CC=g++
CFLAGS=-O3
LDFLAGS=#-static

BeEM: BeEM.cpp
	${CC} ${CFLAGS} $@.cpp -o $@ ${LDFLAGS}
