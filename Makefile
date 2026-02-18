CC = gcc
CFLAGS = `sdl2-config --libs --cflags` -ggdb3 --std=c99 -Wall -Wextra -lSDL2_image -lm

SRC_C = \
		. # \
		../ANSI_C
SRC_H = \
		. \
		tst/ \
		tst/aaa/


SRC_C_PATH = $(foreach \
			 wrd, \
			 $(SRC_C), \
			 $(shell find $(wrd) -type f -name "*.c") \
			 )
SRC_O_PATH = $(SRC_C_PATH:%.c=%.o)
SRC_H_PATH = $(foreach \
			 wrd, \
			 $(SRC_H), \
			 -I $(wrd) \
			 )

EXEC = main

# all:
# 	echo $(SRC_C_PATH)
# 	echo $(SRC_O_PATH)
# 	echo $(SRC_H_PATH)
# 

all: $(EXEC)

$(EXEC): $(SRC_O_PATH)
	$(CC) -o $(EXEC) $(CFLAGS) $(SRC_H_PATH) $^
	# echo "$(EXEC) $^"

$(SRC_O_PATH): %.o: %.c
	$(CC) -c $^ $(CFLAGS) $(SRC_H_PATH) -o $@
	# echo "$@ $^"

clean:
	rm -r $(SRC_O_PATH)

# obj_files = a.result b.o c.o
# src_files = a.raw b.c c.c
# 
# all: $(obj_files)
# .PHONY: all
# 
# $(filter %.o,$(obj_files)): %.o: %.c
# 	echo "target: $@; prereq: $<"
# 
# $(filter %.result,$(obj_files)): %.result: %.raw
# 	echo "target: $@; prereq: $<"
# 
# %.c:
# 	touch $@
# 
# %.raw:
# 	touch $@
# 
# clean:
# 	rm -rf $(src_files)
# 
