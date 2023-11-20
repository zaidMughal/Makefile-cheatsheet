# Consider the last makefile: 

# myprog:file2.o file1.o
# 	gcc -o myprog file2.o file1.o

# file2.o:file2.c
# 	gcc -c -o file2.o file2.c

# file1.o:file1.c
# 	gcc -c -o file1.o file1.c

# It is efficient and doesn't rebuild the target unless necessary.
# But writing it is not efficient. If there are 100 files, would we 
# write 100 rules for object files. And if the directory structure changes, 
# then changing path of every file in the makefile would be tedious task and 
# would be prone to errors.



# To avoid this, we will use a pattern rule.
# A pattern rule contains the character '%' (exactly one of them) in the target
# The target is a pattern for matching file names; the '%' matches any nonempty substring,
# while other characters match only themselves.

# For example, '%.c' as a pattern matches any file name that ends in '.c'.
# 's.%.c' as a pattern matches any file name that starts with 's.', ends in '.c' 
# and is at least five characters long. (There must be at least one character to match the '%'.)

# The dependency/prerequosite of a pattern rule may or may not have '%' in its name.
# '%' in a dependency of a pattern rule stands for the same string that was matched 
# by the '%' in the target. 



# Suppose you are writing a pattern rule to compile a '.c' file into a '.o' file.
# How do you write the 'gcc' command so that it operates on the right source file name?
# You cannot write the name in the recipe, because the name is different each time 
# the pattern rule is applied.

# What you do is use a special feature of make, the automatic variables. 
# These variables have values computed afresh for each rule that is executed, 
# based on the target and prerequisites of the rule. In this example, you would use 
# '$@' for the object file name and '$<' for the source file name.

# '$@' : The file name of the target of the rule. 
# '$<' : The name of the first prerequisite. 
# Complete list of Automatic variables: https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

CFLAGS = -Wall

myprog:file2.o file1.o
	gcc $(CFLAGS) -o myprog file2.o file1.o

%.o:%.c
	gcc $(CFLAGS) -c -o $@ $^	

clean:
	rm -rf file2.o
	rm -rf file1.o
	rm myprog