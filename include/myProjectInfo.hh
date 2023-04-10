#ifndef _MY_PROJECT_MYPROJECTINFO_HH_ 
#define _MY_PROJECT_MYPROJECTINFO_HH_ 

#include<iostream>
#include<cstdlib>

class Project {
    private:
        std::string name;
        std::string code;
        std::string description;
    public: 
        Project(std::string _name,
                std::string _code,
                std::string _description);

        void show_project_info();
};

#endif  // _MY_PROJECT_MYPROJECTINFO_HH_