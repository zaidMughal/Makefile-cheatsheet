# Skipping Unnecessary Build:

# In a rule of makefile, the right hand side of colon is the name of that rule,
# often representing the target file that the rule produces, but not always.

#The left-hand side lists the dependencies of that rule, which may be files or other rules.
# When a dependency is another rule, make proceeds to run that dependency 
# before executing the dependent rule. This dependency rule is executed 
# in every scenario. Example: "Makefile_Two_step.mk"

# However, if the dependencies are files, and the rule name is the target file's 
# name that the rule generates, then the rule may or may not need execution.
# When make encounters such a rule, it compares the 
# last modified timestamps of the latest generated target file and 
# its dependencies. If any of the dependencies were modified after the 
# creation of the target file, make proceeds to rebuild that target file. 
# However, if the most recently created target file has the most recent 
# 'last modified' timestamp, make assumes there is no need to rebuild 
# the target again.

# Take an example of current makefile. If you run "make all", then 
# make will run following commands:
# gcc -c -o file2.o file2.c
# gcc -c -o file1.o file1.c
# gcc -o myprog file2.o file1.o

# And if you run make again, instead of above three commands, only the following command runs:
# gcc -o myprog file2.o file1.o

# The reason is that the rule 'all' is dependent on file2.o and file1.o.
# Make first check rule for file2.o and sees that it is dependent on file2.c.
# Since the rule name is a file, and the dependency is a file, make proceeds to compare
# timestamps of the target and dependency. And since timestamp of target comes out to be later 
# than it s dependency, make decides that it does not need to run the rule for file2.o again.
# Same thing happens with file1.o. And then the recipie of rule 'all' is ran, which 
# results in above command execution.

# This is how make acts smartly and only run the recipie of a rule if it is necessary.
# But even now, make is not as efficient as it could be.

# If you look closely, you will realise that even the rule 'all' does not needs
# to be run again. This can be patched by naming 'all' to 'myprog'.
# Now if you run make again, it won't compile anything unless any dependency file is changed.

CFLAGS := -Wall

all:file2.o file1.o
	gcc $(CFLAGS) -o myprog file2.o file1.o

file2.o:file2.c
	gcc $(CFLAGS) -c -o file2.o file2.c

file1.o:file1.c
	gcc $(CFLAGS) -c -o file1.o file1.c

clean:
	rm -rf file2.o
	rm -rf file1.o
	rm myprog