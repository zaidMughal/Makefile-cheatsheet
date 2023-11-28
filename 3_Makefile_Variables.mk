# Variables and Macros:

# Variables are symbolic names for values that can be reused throughout the makefile.
# The GNU make manual seems to use the words variable and macro interchangeably. But I will 
# call them variables. They can be dereferenced using $(var) or ${var}, with parentheses being more common.

# Most common methods to assign values to variables is with '=' or ':='

# 1. = (Lazy Assignment/Recursive assignment):
# When we use '=', it represents a lazy assignment.
# The right-hand side is evaluated lazily, meaning the assignment is made but the assigned string 
# is not evaluated. It will be evaluated when when the variable is actually used.
# For example, 
#		"MAKE_DEPEND = $(CC)" will set value of "MAKE_DEPEND" as "$(CC)"
# It does not matter what is the current value of CC. 
# It will only be evaluated when MAKE_DEPEND is used; and everytime when MAKE_DEPEND is used.

# 2. := (Simple/Immediate Assignment):
# When we use :=, it represents a simple, immediate assignment.
# The right-hand side is evaluated immediately and the result is stored as-is.
# This ensures that the variable will have the same value whenever its referenced.
# For example, 
#		"MAKE_DEPEND := $(CC)" will set value of "MAKE_DEPEND" as "gcc" 
# Assuming the current value of CC was gcc.
# Now whenever MAKE_DEPEND is referenced, it will be evaluated to the value "gcc", 
# even if later CC is assigned "clang" or some other value.


# Example:

# Compiler flags set to enable all warnings
CFLAGS = -Wall

TIME_LAZY = $(shell date +'%N')
TIME_IMME := $(shell date +'%N')
# In $(shell date +'%N'), 'date' is the shell command to show date, and '%N' specifies to only display nanosconds.
# Writing 'shell' before a command makes the succeeding command to run in shell.	
# If we run "date +'%N'" in linux shell, we will see the nanosecond part of time.
# More on $(shell...) in "Makefile_Built-in_functions".

all:
	@echo "Time assigned using '=' is $(TIME_LAZY) (evaluated at runtime)"
	@echo "Time assigned using ':=' is $(TIME_IMME) (evaluated at assignment time)"
	gcc $(CFLAGS) -o myprog file2.c file1.c
	@echo "Time assigned using '=' is $(TIME_LAZY) (evaluated at runtime)"
	@echo "Time assigned using ':=' is $(TIME_IMME) (evaluated at assignment time)"

# Note: In a makefile, prefixing a command with @ suppresses the default behavior of printing 
# the command to the standard output before executing it. This is useful for preventing 
# unnecessary clutter in the terminal or console when the makefile is run.

clean:
	rm -rf file2.o
	rm -rf file1.o
	rm myprog