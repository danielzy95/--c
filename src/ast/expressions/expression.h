#ifndef EXPR
#define EXPR

#include "../ast-node.h"

class Expression : public ASTNode {
public:
    int place;
    virtual int size() { return 0; }
    virtual string genCode(bool preserve = false) { return ""; }
    virtual bool isAssignable() { return false; }
    virtual string genAddrCode(bool preserve = false) { return ""; }
};

#endif