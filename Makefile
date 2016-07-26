CC=clang++
LD=llvm-link
CFLAGS=-c -Wall -g3 -emit-llvm -fno-use-cxa-atexit
LDFLAGS=
SOURCES=main.cc interface.cc
OBJECTS=$(SOURCES:.cc=.o)
TARGET=assignment-1
SUBMIT_FILES=$(SOURCES) $(TARGET) README.md

all: $(SOURCES) $(TARGET)

$(TARGET): $(OBJECTS) 
	$(LD) $(LDFLAGS) $(OBJECTS) -o $@

.cc.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm *.o *.tar *.s $(TARGET)

# Everything past this point is only for TAs.

a1: 
	make CC=g++ LD=g++ CFLAGS='$(CFLAGS) -w'

static:
	make
	llc $(TARGET)
	$(CC) -static $(TARGET).s -o $(TARGET)

submission:
	make clean
	make static
	tar cf r`git rev-list --count HEAD`.`git rev-parse --short HEAD`.tar $(SUBMIT_FILES)
