//#include <cstdlib>
//#include <iostream>
#include "message.hh"
#include "myProjectInfo.hh"

using namespace std;

int main()
{
  message m;
  Project my_template("template for C/C++ Project", 1);

  //Print message
  m.print_message();
  my_template.show_project_info();

  return EXIT_SUCCESS;
}