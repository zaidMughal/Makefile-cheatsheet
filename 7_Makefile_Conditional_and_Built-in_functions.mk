# Conditional Directives and Information Printing in Makefile:

# Conditional directives in Makefile i.e. ifeq, ifneq, ifdef, and ifndef, allow decisions
# based on the environment, user input, or other factors. The first two compare variable 
# values after eveluating them, while the latter two only check if a variable is empty or 
# non-empty. These directives can also be used within rules.

# This Makefile also demonstrates the use of functions, such as $(info ...), to print information.
# Makefile supports both built-in and user-defined functions. One of the few built-in functions
# are $(info ...), $(warning ...) and $(error ...).
# Note: For calling these functions in conditionals, immediate assignment to a variable is required.

# This makefile shows the usage of $(info ...).
# Following makefile will go into more detail in built-in functions.

# Uptill now, the command that we were using to print information was echo.
# It is a shell command and can only be run in shell. While $(info ...) is
# native to makefile and can be used anywhere.


.PHONY: clean

CFLAGS :=-Wall

# @echo "Starting build process"		# Would only work inside a rule
$(info Starting build process)			# Would work anywhere

ifeq ($(DEBUG), 1)		# If condition will run if value of DEBUG is 1. This variable is expected t be passed by user while giving make command
	CFLAGS += -g
	tmp := $(info Debug mode is enabled!)
else
    CFLAGS += -O2       # O2 flag asks gcc to optimize the code.
endif

ifdef CFLAGS			# If condition will run if CFLAGS has been assigned any non-zero value
	tmp := $(info CFLAGS="$(CFLAGS)")
endif

myprog:file2.o file1.o
	gcc $(CFLAGS) -o myprog file2.o file1.o
ifeq ($(DEBUG), 1)
	@echo "You can start debugging now"
else
	@echo "To compile with debug flag, run \"make DEBUG=1 -f 7_Makefile_Conditional_Statement.mk\""
endif

%.o:%.c
	gcc $(CFLAGS) -c -o $@ $^

clean:
	rm -rf *.o
	rm myprog