target = repl

repl: repl.c s7.o Makefile
	clang -o repl repl.c s7.o -lm -I.

s7.o: s7.c s7.h mus-config.h Makefile
	clang -c s7.c -I .

mus-config.h:
	touch mus-config.h

test: repl libc.scm repl.scm cload.scm
	./repl

clean:
	rm -fv mus-config.h s7.o libc_s7.c libc_s7.so

allclean: clean
	rm -fv repl

