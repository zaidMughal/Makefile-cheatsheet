# Before going further into makefiles, I suggest you to have a good understanding of 
# the compilation process. It consists of the following parts:
# 1. Preprocessing
# 2. Compilation
# 3. Assemble
# 4. Linkeing

# Following video will help you have a good understanding of this process:
# How the C++ Compiler Works:
# https://www.youtube.com/watch?v=3tIqpEmWMLI&pp=ygUaY29tcGlsZXRpb24gcHJvY2VzcyBjaGVybm8%3D
# How the C++ Linker Works:
# https://www.youtube.com/watch?v=H4s55GgAg0I&pp=ygUaY29tcGlsZXRpb24gcHJvY2VzcyBjaGVybm8%3D


# Now that you have prerequosites down, let us understand the following makefile

# This makefile does the exact same job as "1_Makefile.mk", but it divides the compilation process 
# into two rules to better explain the linking process.

# The rule 'preprocess_compile_assemble' only converts the c files into their object files (assembly code).
# The rule 'link' only links the two object files into an executable, and it is 
# dependent on 'preprocess_compile_assemble' rule to generate those object files.
# Whenever 'link' is run, it automatically triggers the 'preprocess_compile_assemble' rule to run first.

# While the rule 'preprocess' only preprocesses the files. It can be run using 'make preprocess'


link:preprocess_compile_assemble
	gcc -o myprog file2.o file1.o

preprocess_compile_assemble:
	gcc -c file1.c file2.c

clean:
	rm -rf file2.o
	rm -rf file1.o
	rm -rf file2_preprocessed
	rm -rf file1_preprocessed
	rm myprog

#---------------------------------------------------------------------

# If you want to observed how the preprocessed code looks like, you can run 'make preprocess'
preprocess:
	gcc -E file2.c -o file2_preprocessed
	gcc -E file1.c -o file1_preprocessed