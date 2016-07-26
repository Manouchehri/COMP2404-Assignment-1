SOURCES=main.cc
OBJECTS=$(SOURCES:.cc=.o)
EXECUTABLE=assignment-1.elf
CC=g++
CFLAGS=-c -Wall

$(EXECUTABLE): $(OBJECTS)
	$(CC) -o $(EXECUTABLE) $(OBJECTS)

a1: $(EXECUTABLE) # For TAs.

clean:
	-rm *.o *.elf
