#ifndef _MY_PROJECT_MYPROJECTINFO_HH_ 
#define _MY_PROJECT_MYPROJECTINFO_HH_ 

#include<iostream>
#include<cstdlib>

class Project {
    private:
        std::string name;
        int number;
    public: 
        Project(std::string _name, int _number);
        void show_project_info();
};

#endif  // _MY_PROJECT_MYPROJECTINFO_HH_