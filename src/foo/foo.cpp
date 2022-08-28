#include "foo.hpp"

namespace foo_namespace
{
    foo::foo() : a{10}, b{vector<int>(10, 0)} {}
    foo::~foo() {}
    foo::foo(const int x, vector<int> y) : a{x}, b{y} {}
}
