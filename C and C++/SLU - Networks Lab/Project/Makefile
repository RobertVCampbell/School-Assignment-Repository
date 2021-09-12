CC=gcc
CFLAGS=-Wall
COMPFLAGS=-L/usr/lib -lssl -lcrypto

all: server client

server: server.c
	$(CC) $(CFLAGS) server.c -o server $(COMPFLAGS)

client: client.c
	$(CC) $(CFLAGS) client.c -o client $(COMPFLAGS)
