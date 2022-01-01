#include <core/test.h>
#include "func.h"
#include "stl.h"
#include <iostream>
int main (){
    A c;
    A b;
    std::cin >> c.a >> b.a;
    std::cout << TEST_SL::mul(c.a, b.a) << std::endl;
    
    std::cout << TEST_DL::add(c, b).a << std::endl;
    return 0;
}
