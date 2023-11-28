# Makefile Rules and Phony Targets:

# Makefile rules execute based on timestamp comparisons between targets and dependencies.
# If a target's timestamp is lesser than any of its dependencies, the rule runs. Otherwise 
# it doesn't, as shown in "Makefile_Skip_unnecessary_build".

# In the case that there there is no dependency, but the rule does create a target file,
# then the rule will be run if the target file do not exist, and it will not be run if the 
# target file already exists.

# This logic works well, unless the rule name does not represent a target file.
# Take example of 'clean' rule. We want it to run every time when it is called. 
# But what if there is a file named "clean". Then GNUmake will think that the file 
# that this rule needed to create is already created. And since it have no dependency, 
# GNUmake will skip running this rule. To avoid this, we use phony targets.

# Phony targets in a makefile are used to specify tasks that don't represent actual 
# files. These targets are called "phony" because they don't create an output file 
# with the same name, and they are often used for tasks like cleanup or informational
# purposes. Phony targets help prevent conflicts with files of the same name and ensure 
# that the associated commands are always executed, regardless of whether a file 
# with the same name exists.


CFLAGS := -Wall

myprog:file2.o file1.o
	gcc $(CFLAGS) -o myprog file2.o file1.o

%.o:%.c
	gcc $(CFLAGS) -c -o $@ $^	

.PHONY: info
info:
	@echo C"FLAGS=$(CFLAGS)"

.PHONY: clean
clean:
	rm -rf *.o
	rm myprog


# Another change I have added in this makefile is that "rm -rf <filename>" 
# is replaced with "rm -rf *.o".

# "*" is regex character that can match with any string, even NULL. So, any file ending 
# with ".o" will be matched with "*.o", and "rm -rf *.o" command will delete any such file.

# This method helps in scaling of the makefile. If we proceeds with writing filename, 
# then we would need to edit the makefile on every filename change of project.

# As such you can use any regex character in any makefile command.