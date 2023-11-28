# Commonly used flags of gcc:
#	-E                      Preprocess only; do not compile, assemble or link.
#	-S                      Compile only; do not assemble or link.
#	-c                      Compile and assemble, but do not link.
#	-o <file>               Place the output into <file>.
#	-Wall                   Display all warnings
#   -B <directory>          Add directory to compiler's search paths

info:
	@echo "Command syntax of make:"
	@echo "make <rule_name> -f <filename>"
	@echo "or"
	@echo "make DEBUG=1 <rule_name> -f <filename>"
	@echo "Example: \"make DEBUG=1 myprog -f 7_Makefile_Conditional_and_Built-in_functions.mk\""
all:
	gcc -o myprog file2.c file1.c

clean:
	rm -rf *.o
	rm -rf *.d
	rm myprog