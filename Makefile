#	-E                      Preprocess only; do not compile, assemble or link.
#	-S                      Compile only; do not assemble or link.
#	-c                      Compile and assemble, but do not link.
#	-o <file>               Place the output into <file>.
#	-Wall			Display all warnings
#	-B <directory> 		Add directory to compiler's search paths

#Parts:
# Preprocess
# Compile
# Assemble
# Link
#---------------------------------------------------------------------
VAR = This is a VAR

info:
	@echo $(VAR)
	echo hi
	@echo "The commands with @ are not printed on terminal, but still, their result is (as shown)"
	$(info "This is info, $(VAR)")

all:
	gcc -o myprog file2.c file1.c

link:compile_and_assemble
	gcc -o myprog file2.o file1.o

compile_and_assemble:
	gcc -c file1.c file2.c

#---------------------------------------------------------------------

link2:file2.o file.o
	gcc -o myprog file2.o file1.o

#regular expression where % is a wildcard
# $@ is everything on left side of :
# $^ is everything on right side of :
%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $^	

#---------------------------------------------------------------------

preprocess:
	gcc -E file1.c -o file1_preprocessed
	gcc -E file2.c -o file2_preprocessed

#---------------------------------------------------------------------

clean:
	rm -rf *.o
	rm -rf *.d
	rm myprog