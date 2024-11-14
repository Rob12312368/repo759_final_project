all:
	gcc -Isrc -Itest src/main.c src/AES.c test/test.c -o aes

open:
	gcc -fopenmp -Isrc -Itest src/main.c src/AES.c test/test.c -o open_aes

clean:
	rm -f aes open_aes Task.out Task.err

.PHONY: all open clean