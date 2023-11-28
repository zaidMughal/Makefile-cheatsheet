
# Makefile Built-in Functions Overview:

# Makefile provides several built-in functions that you can use to manipulate text strings, 
# file and directory names, and much more. A function call resembles a variable reference. 
# It can appear anywhere a variable reference can appear, and it is expanded using the same 
# rules as variable references. A function call looks like this:
# 		$(function arguments)
# or like this:
# 		${function arguments}
# function is a function name; one of a short list of names that are part of make. 
# You can also essentially create your own functions by using the call built-in function.



# Following are some commonly used built-in functions:

# 1. Text Manipulation:
# 	a. $(subst from,to,text): Replaces occurrences of from with to in text.
# 		Example:
# 		VAR := $(subst a,b,abc)
# 		VAR now contains "bbc"

# 	b. $(patsubst pattern,replacement,text): Performs pattern-based substitution in text.
# 		Example:
# 		VAR := $(patsubst %.c,%.o,source.c)
# 		VAR now contains "source.o"

# 	c. $(strip string): Removes leading and trailing whitespace from string and replaces each 
#						internal sequence of one or more whitespace characters with a single space.
# 		Example:
# 		VAR := $(strip a b c )
# 		VAR now contains 'a b c'


# 2. File and Path Functions:
# 	a. $(dir names...): Extracts the directory part of file names.
# 		Example:
# 		DIR := $(dir src/main.c src/utils.c)
# 		DIR now contains "src/ src/"

# 	b. $(notdir names...): Extracts the non-directory part of file names.
# 		Example:
# 		FILES := $(notdir src/main.c src/utils.c)
# 		FILES now contains "main.c utils.c"

# 	c. $(wildcard regex_pattern): Expands to the list of filenames matching the regex wildcard pattern.
# 		Example:
# 		FILES := $(wildcard *.c)
# 		FILES now contains a sorted list of .c files in the current directory


# 3. Conditional Functions:
# 	a. $(if condition,then-part[,else-part]): Evaluates condition and returns then-part if true, otherwise else-part.
# 		Example:
# 		DEBUG := 1
# 		CFLAGS := $(if $(DEBUG), -g, -O2)
# 		CFLAGS now contains "-g"


# 4. Foreach function
# It causes one piece of text to be used repeatedly, each time with a different substitution 
# performed on it. The syntax of the foreach function is:
# 		$(foreach var,list,text)
# The first two arguments, var and list, are expanded before anything else is done; 
# note that the last argument, text, is not expanded at the same time. Then for each word of 
# the expanded value of list, the variable named by the expanded value of var is set to that 
# word, and text is expanded. Presumably text contains references to that variable, 
# so its expansion will be different each time.

# The result is that text is expanded as many times as there are whitespace-separated words in 
# list. The multiple expansions of text are concatenated, with spaces between them, to make the 
# result of foreach.

# Following example sets the variable 'files' to the list of all files in the directories 
# in the list 'dirs':
# dirs := a b c d
# files := $(foreach dir,$(dirs),$(wildcard $(dir)/*))
# Here text is '$(wildcard $(dir)/*)'. The first repetition finds the value 'a' for dir, 
# so it produces the same result as '$(wildcard a/*)'; 
# the second repetition produces the result of '$(wildcard b/*)'; 
# and the third, that of '$(wildcard c/*)'.

# This example has the same result (except for setting 'dirs') as the following example:
# files := $(wildcard a/* b/* c/* d/*)


# 5. Shell function
# The shell function is unique in a way that it communicates with the world outside of GNUmake.
# Another function that communicates outside the GNUmake is wildcard function.
# The shell function takes as an argument, which is a shell command and expands to the output of the command. 
# The only processing make does on the result is to convert each newline (or carriage-return / newline pair) 
# to a single space. If there is a trailing (carriage-return and) newline it will simply be removed.

# Because this function involves spawning a new shell, you should carefully consider the performance 
# implications of using the shell function within lazily assigned variables vs. immediately assigned variables.

# Present makefile only skims a small subset of makefile functions that are most common.
# To get in-detail knowledge, read https://www.gnu.org/software/make/manual/html_node/Functions.html



# Take into consideration the following example makefile, responsible for compiling the "tictactoe" project 
# in the "tictactoe" directory. The current makefile encapsulates and synthesizes the concepts explained in 
# the preceding makefiles.

# It employs a technique that involves scanning the provided directories for both .h and .c files.
# Using this information, the makefile dynamically determines the objects it should generate and
# how to link them together. This methodology proves to be highly scalable compared to the alternative
# approach of manually listing file names. For instance, if a new file is added to the project directory,
# the makefile autonomously determines its treatment based on the file's directory and extension.

.PHONY: clean

BINARY= myprog
CODEDIRS= ./tictactoe/src
INCDIRS= ./tictactoe/include
CC=gcc

# automatically add the include flag (-I) onto each include directory
CFLAGS:=-Wall $(foreach D, $(INCDIRS), -I$(D))
CFLAGS+= $(if $(DEBUG), -g, -O2)
$(info CFLAGS="$(CFLAGS)")

#Automatically pick up C files from all code directories
CFILES:=$(foreach D,$(CODEDIRS), $(wildcard $(D)/*.c))
$(info CFILES="$(CFILES)")

#regular expression replacement 
OBJECTS=$(patsubst %.c,%.o, $(CFILES))
$(info OBJECTS="$(OBJECTS)")

all:$(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) -o $(BINARY) $^ 

%.o:%.c
	$(CC) $(CFLAGS) -c -o $@ $^

clean:
	rm -rf $(BINARY) $(OBJECTS)