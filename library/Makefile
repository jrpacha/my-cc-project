libmyProjectInfo.a: myProjectInfo.o
	$(AR) rc libmyProjectInfo.a myProjectInfo.o
	cp -f libmyProjectInfo.a ../lib

myProjectInfo.o: myProjectInfo.cc ../include/myProjectInfo.hh
	$(CXX) -c myProjectInfo.cc \
		 -omyProjectInfo.o -I../include 
clean: 
	rm myProjectInfo.o

mrproper: clean
	rm libmyProjectInfo.a

help: 
	@echo "make           # builds the library"
	@echo "make clean     # removes the .o files"
	@echo "make mrproper  # removes the library as well"

.PHONY: clean mrproper
