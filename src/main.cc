//#include <cstdlib>
//#include <iostream>
#include "message.hh"
#include "myProjectInfo.hh"

//using namespace std;

int main()
{
  message m;
  Project my_template("my-cc-project-template", 
                      "001",
                      "template for C/C++ projects");
  //Print info of the current project
  my_template.show_project_info();
  //Show message
  m.print_message("See README.md for more info");

  return EXIT_SUCCESS;
}