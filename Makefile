# Makefile for C/C++ projects
# See the references in README.md

EXEDIR= bin
SRCDIR= src
HDIR= include
LIBDIR= lib
OBJDIR= .o
DEPDIR= .d

DIRS= .vscode bin images include lib library src

CCX = g++
CPPFLAGS+= -MMD -MP -MF $(DEPDIR)/$*.Td #-cpp: does not work with clang/clang++)

CCFLAGS+= -g -O0 -W -fPIC
CCLIBS+= #-lm -lgmp -lmpfr

CXXFLAGS+= -g -O0 -W -fPIC
CXXLIBS+= #-lm -lgmp -lmpfr

PROG=$(notdir $(CURDIR))#name of the project

SRCS_ALL=$(wildcard $(SRCDIR)/*.c)
SRCS_ALL+=$(wildcard $(SRCDIR)/*.cc)

SRCS=$(filter-out %_flymake.c, $(notdir $(basename $(SRCS_ALL))))
SRCS+=$(filter-out %_flymake.cc, $(notdir $(basename $(SRCS_ALL))))

OBJS=$(patsubst %,$(OBJDIR)/%.o,$(SRCS))
DEPS=$(patsubst %,$(DEPDIR)/%.d,$(SRCS))

LIBS_ALL=$(wildcard $(LIBDIR)/*.a)
LIBS=$(filter-out %_flymake.a, $(notdir $(basename $(LIBS_ALL))))

#LDFLAGS+= -dynamic $(LIBS_ALL)
LDFLAGS+= -L$(LIBDIR) $(LIBS:lib%=-l%) #-dynamic

$(shell mkdir -p $(OBJDIR) >/dev/null)
$(shell mkdir -p $(DEPDIR) >/dev/null)
$(shell mkdir -p $(EXEDIR) >/dev/null)

all: build install

default: build

build: $(EXEDIR)/$(PROG)

$(EXEDIR)/$(PROG): $(OBJS) 
	$(CXX) $^ $(LDFLAGS) $(CCLIBS) $(CXXLIBS) -o $@ 
	@echo
	@echo "$(EXEDIR)/$(PROG) created."  
	@echo	

help:
	@echo "make          # to build the executable"
	@echo "make run      # runs the program: .$(EXEDIR)/$(PROG)"
	@echo "make help     # to see all the command line options"
	@echo "make clan     # to delete the object and dep files"
	@echo "make mrproper # same as make clean, but also removes the directory bin"
	@echo	

clean:
	rm -f $(OBJDIR)/*.o $(DEPDIR)/*.d
	rmdir $(OBJDIR) $(DEPDIR) >/dev/null

mrproper: clean
	rm -f $(EXEDIR)/*
	rmdir $(EXEDIR) >/dev/null

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(DEPDIR)/%.d
	$(CC) $(CCFLAGS) $(CPPFLAGS) -I$(HDIR) -c $< -o$@
	mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d

$(OBJDIR)/%.o: $(SRCDIR)/%.cc $(DEPDIR)/%.d
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -I$(HDIR) -c $< -o$@
	mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d

$(DEPDIR)/%.d:;
.PRECIOUS: $(DEPDIR)

-include $(DEPS)

.PHONY: all default build install run clean mrproper $(DIRS)