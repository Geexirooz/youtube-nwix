# Define the compiler
CC = gcc

# Define the compiler flags
CFLAGS = -Wall -g

# Define the target executable
TARGET = hello

# Define USERNAME
USERNAME = World

# Rule to build the target
all: $(TARGET)

$(TARGET): src/hello.o
	$(CC) $(CFLAGS) -o $(TARGET) src/hello.o

src/hello.o: src/hello.c
	$(CC) $(CFLAGS) -DUSERNAME=\"$(USERNAME)\" -c src/hello.c -o src/hello.o

clean:
	rm -f src/hello.o $(TARGET)

