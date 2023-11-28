# Commonly used flags of gcc:
#	-E                      Preprocess only; do not compile, assemble or link.
#	-S                      Compile only; do not assemble or link.
#	-c                      Compile and assemble, but do not link.
#	-o <file>               Place the output into <file>.
#	-Wall                   Display all warnings
#	-B <directory>          Specifies where to find the executables, libraries, include files, 
#	                        and data files of the compiler itself.
#	-I <path>               These options specify directories to search for header files, 
#	                        for libraries and for parts of the compiler

# For more information, visit https://gcc.gnu.org/onlinedocs/gcc/Directory-Options.html

info:
	@echo "Command syntax of make:"
	@echo "make [options] [target]"
	@echo "or"
	@echo "make -f [filename] [target] DEBUG=1 "
	@echo "Example: \"make -f 7_Makefile_Conditional_and_Built-in_functions.mk myprog DEBUG=1\""
all:
	gcc -o myprog file2.c file1.c

clean:
	rm -rf *.o
	rm -rf *.d
	rm myprog