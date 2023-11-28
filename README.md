# Makefile-cheatsheet

This repo serves as a basic tutorial on makefiles. Beginning with a straightforward makefile and gradually introducing more advanced features, I've crafted it as a crash course on the subject. 

The contents within this repository encompass what you'll be dealing with about 70% of the time when working with makefiles. Each makefile is annotated with comments providing explanations. It is designed for someone to go through the tutorial in approximately half an hour to one hour.

Command syntax of make:
make [options] [target]
Example 1 : "make"
Example 2 : "make -f 7_Makefile_Conditional_and_Built-in_functions.mk myprog DEBUG=1"
-f      : option to pass the Makefile filename
myprog  : target name
DEBUG   : variable passed to makefile by the user


Official documentation of GNUmake: https://www.gnu.org/software/make/manual/html_node/index.html