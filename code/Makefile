all:
	gcc -Isrc -Itest src/main.c src/AES.c test/test.c -o aes

open:
	gcc -fopenmp -Isrc -Itest src/main.c src/AES.c test/test.c -o open

clean:
	rm -f aes
	rm -f open