PSPSDK = $(shell psp-config --pspsdk-path)
PSPDIR = $(shell psp-config --psp-prefix)

CFLAGS = -O2 -G0 -g -fmodules-ts -std=gnu++11

INCLUDES = ./include
SOURCES = ./src
CPPFILES = $(foreach dir,$(SOURCES), $(wildcard $(dir)/*.cc))
INCDIR = $(foreach dir,$(INCLUDES), $(CURDIR)/$(dir))

OBJS = $(CPPFILES:.cc=.o)
TARGET_LIB = libfmt.a

include $(PSPSDK)/lib/build.mak

install: all
	mkdir -p $(PSPDIR)/include $(PSPDIR)/lib
	cp -r $(INCLUDES)/* $(PSPDIR)/include
	cp *.a $(PSPDIR)/lib