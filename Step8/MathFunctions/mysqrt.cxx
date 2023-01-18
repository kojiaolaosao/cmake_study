#include <iostream>

#include "MathFunctions.h"
#include "Table.h"
// a hack square root calculation using simple operations
double mysqrt(double x) {
    if (x <= 0) {
        return 0;
    }

    // if we have both log and exp then use them
    double result = x;

    if (x>=1&&x<=10) {
        std::cout<<"Use table"<<std::endl;
        result=sqrtTable[static_cast<int>(x)];
    }
    // do ten iterations
    for (int i = 0; i < 10; ++i) {
        if (result <= 0) {
            result = 0.1;
        }
        double delta = x - (result * result);
        result = result + 0.5 * delta / result;
        std::cout << "Computing sqrt of " << x << " to be " << result << std::endl;
    }
    return result;
}
