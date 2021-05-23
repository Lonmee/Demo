//
//  CPPTest.cpp
//  Demo
//
//  Created by Lonmee on 5/21/21.
//

#include "CPPTest.hpp"

using namespace std;

struct ListNode {
    int val;
    ListNode *next;
};

class Solution {
    void createList(ListNode *head) {
        for (int i = 1; i < 10; i++) {
            ListNode* node = new ListNode();
            node -> val = i;
            node -> next = NULL;
            head = node;
        }
    }
    
};
