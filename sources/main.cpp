/*
 * http://www.mariobadr.com/using-clang-tidy-with-cmake-36.html
 */

// #include <header.h>
#include <iostream>

using namespace std;

int main()
{
    auto a = new int;
    *a = 5;

    std::cout << "asd" << std::endl << *a;

    // delete a;

    return 0;
}
