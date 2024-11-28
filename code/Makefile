# all:
# 	gcc -Isrc -Itest src/main.c src/AES.c test/test.c -o aes

# open:
# 	gcc -fopenmp -Isrc -Itest src/main.c src/AES.c test/test.c -o open_aes

# clean:
# 	rm -f aes open_aes Task.out Task.err

# .PHONY: all open clean



SRC = src/aes.c src/main.c test/test.c
HEADER = src/aes.h test/test.h
CC = gcc
AES_FLAGS = -Itest -Isrc
OPEN_FLAGS = -Itest -Isrc -fopenmp

all: aes open

aes: $(SRC) $(HEADER)
	$(CC) $(AES_FLAGS) -o aes $(SRC)

open: $(SRC) $(HEADER)
	$(CC) $(OPEN_FLAGS) -o open $(SRC)

run_aes: aes
	sbatch slurm.sh aes

run_open: open
	sbatch slurm.sh open

clean:
	rm -f aes open

