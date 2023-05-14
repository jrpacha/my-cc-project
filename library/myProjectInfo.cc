#include "myProjectInfo.hh"

Project::Project(std::string _name,
                 std::string _code,
                 std::string _description)
{
    name = _name; 
    code = _code;
    description = _description;
}
   
void Project::show_project_info()
{
    std::cout 
        << "Project name: " << name
        << " Code: " << code 
        << "\n"
        << "Description: "
        << description
        << "\n";
}