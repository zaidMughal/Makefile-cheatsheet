#	-E                      Preprocess only; do not compile, assemble or link.
#	-S                      Compile only; do not assemble or link.
#	-c                      Compile and assemble, but do not link.
#	-o <file>               Place the output into <file>.
#	-Wall			Display all warnings
#	-B <directory> 		Add directory to compiler's search paths

#	-d			debug flag. It outputs details of makefile.  e.g. "make info -d"
#Parts:
# Preprocess
# Compile
# Assemble
# Link
#---------------------------------------------------------------------

all:
	gcc -o myprog file2.c file1.c

clean:
	rm -rf *.o
	rm -rf *.d
	rm myprog