#include "myProjectInfo.hh"

Project::Project(std::string _name, int _number)
{
    name = _name; 
    number = _number;
}
   
void Project::show_project_info()
{
    std::cout << "Project name: " << name << std::endl;
    std::cout << "Code: " << number << std::endl;
}