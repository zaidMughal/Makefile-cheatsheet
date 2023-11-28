# Compilation Process Overview:

# Before delving into makefiles, understanding the compilation process is essential.
# It involves four stages:
# 1. Preprocessing
# 2. Compilation
# 3. Assembly
# 4. Linking

# For a comprehensive understanding of the C++ compilation process, watch:
# "How the C++ Compiler Works":
# https://www.youtube.com/watch?v=3tIqpEmWMLI&pp=ygUaY29tcGlsZXRpb24gcHJvY2VzcyBjaGVybm8%3D
# "How the C++ Linker Works":
# https://www.youtube.com/watch?v=H4s55GgAg0I&pp=ygUaY29tcGlsZXRpb24gcHJvY2VzcyBjaGVybm8%3D

# With the prerequisites covered, let's explore the following makefile.

# This makefile performs the same task as "1_Makefile.mk" but divides the compilation process
# into two rules to better explain the linking process.

# The 'preprocess_compile_assemble' rule converts the C files into their object files (assembly code).
# The 'link' rule links the object files into an executable, dependent on the
# 'preprocess_compile_assemble' rule to generate those object files.
# Running 'link' automatically triggers the 'preprocess_compile_assemble' rule first.

# The 'preprocess' rule preprocesses the files and can be run using 'make preprocess'.

link: preprocess_compile_assemble
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

# To observe the preprocessed code, run 'make preprocess'.
preprocess:
	gcc -E file2.c -o file2_preprocessed
	gcc -E file1.c -o file1_preprocessed
