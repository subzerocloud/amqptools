.PHONY: all build

CFLAGS=-I/opt/local/include -Wno-deprecated-declarations
LDFLAGS=-L/opt/local/lib -lrabbitmq -Bstatic

all: clean build

build: amqpspawn amqpsend

install: build
	install -D -m0755 amqpspawn $(PREFIX)/bin/amqpspawn
	install -D -m0755 amqpsend $(PREFIX)/bin/amqpsend

uninstall:
	rm -f $(PREFIX)/bin/amqpspawn
	rm -f $(PREFIX)/bin/amqpsend

amqpspawn: amqpspawn.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $? $(LDFLAGS)

amqpsend: amqpsend.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ $? $(LDFLAGS)

clean:
	-rm -f amqpsend amqpspawn
