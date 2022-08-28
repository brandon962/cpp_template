#ifndef __FOO_H_INCLUDED__
#define __FOO_H_INCLUDED__
#include <iostream>
#include <vector>

using std::cout;
using std::endl;
using std::string;
using std::vector;

namespace foo_namespace
{
    class foo
    {
    private:
        int a;
        vector<int> b;

    public:
        foo();
        ~foo();
        foo(const int, vector<int> b);
        foo(const foo &) = default;
        foo(foo &&) = default;
        foo &operator=(const foo &) = default;
        foo &operator=(foo &&) = default;
    };

} // namespace foo

#endif