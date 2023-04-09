libmyProjectInfo: myProjectInfo.o
	ar -rv libmyProjectInfo.a myProjectInfo.o
	mv -f libmyProjectInfo.a ../lib

myProjectInfo.o: myProjectInfo.cc ../include/myProjectInfo.hh
	$(CXX) -c myProjectInfo.cc \
		 -omyProjectInfo.o -I../include 
clean: 
	rm myProjectInfo.o

mrproper: clean
	rm libmyProjectInfo.a
