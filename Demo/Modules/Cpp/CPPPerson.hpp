//
//  CPPPersion.hpp
//  Demo
//
//  Created by Lonmee on 8/29/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

#ifndef CPPPersion_hpp
#define CPPPersion_hpp

#include <stdio.h>
#include <iostream>

using namespace std;
class CPPPerson {
    string name;
    int age;
    int male;
    
public:
    CPPPerson();
    CPPPerson(const char* name, int age, int male);
    ~CPPPerson();
    
    void info();
    const char* getName();
};

#endif /* CPPPersion_hpp */
