//
//  CPPPersion.cpp
//  Demo
//
//  Created by Lonmee on 8/29/20.
//  Copyright © 2020 Lonmee. All rights reserved.
//

#include "CPPPerson.hpp"
#include "Demo-Bridging-Header.h"

CPPPerson::CPPPerson() {
    this->name = "Lonmee";
    this->age = 38;
    this->male = true;
}

CPPPerson::CPPPerson(const char* name, int age, int male) {
    this->name = name;
    this->age = age;
    this->male = male;
}

CPPPerson::~CPPPerson() {
    cout << "release person instance";
}

const char* CPPPerson::getName() {
    return name.data();
}

void CPPPerson::info() {
    cout << "i am " << name << ", my age is "<< age << " i am a " << (male == 1 ? "man" : "woman") << ".";
}

CPPPersonModel create() {
    return new CPPPerson();
}

CPPPersonModel createBy(const char* name, int age, int male) {
    return new CPPPerson(name, age, male);
}

void info(CPPPersonModel model) {
    CPPPerson *p = (CPPPerson *)model;
    p->info();
}

const char* getName(CPPPersonModel model) {
    CPPPerson *p = (CPPPerson *)model;
    return p->getName();
}

void destory(CPPPersonModel model) {
    CPPPerson *p = (CPPPerson *)model;
    delete p;
}
