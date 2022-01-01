#include <core/test.h>

A A::operator+(const A& rhs){
    A ret;
    ret.a = this->a + rhs.a;
    return ret;
}
