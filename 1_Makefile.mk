

# What is a Makefile:
# A Makefile is a text file that contains a set of rules specifying how to 
# build a target file or a group of target files. It consists of a series 
# of rules, each describing a target, its dependencies, and the commands 
# to build the target.

# Of course we can simply give the build commands through gcc to compile the necessary files,
# but as the project gets complex, we need to automate this process.

# Syntax and Structure:
# A Makefile is organized into rules, where each rule follows a specific syntax. 
# A rule consists of a target, dependencies, and commands. The target is the file 
# or task to be built, the dependencies are the files or tasks that the target depends on, 
# and the commands are the actions to be executed to build the target. These commands are 
# typically shell commands, and each command line must begin with a tab character.
# Example:
# target: dependencies
#     commands
#     more_commands
#     


# In this makefile, I have written two rules named 'all' and 'clean'.
# Conventionally, the name of the rule is the name of target file it generates, but is is not a necessity.
# The effect of naming the rule same as that of the target file is explained in "4_Makefile_file_named_rule".

# In 'all', there is a simple command that uses gcc compiler to compile two files, file1.c and file2.c.
# The resultant compiled executable is stored in the output file indicated by -o, which is 'myprog' in this case.

# While 'clean', as the name suggests, gives commands to remove any files that could have been generated 
# as a result of compilation process.

# Note that the group of commands that a rule defines is also called a recipie.
# And if you run 'make' without specifying which rule to run, only the first rule will get executed,
# which in this case is 'all'.

all:
	gcc -o myprog file2.c file1.c

clean:
	rm -rf file2.o
	rm -rf file1.o
	rm myprog

	