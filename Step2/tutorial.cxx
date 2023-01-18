// A simple program that computes the square root of a number
#include <cmath>
#include <iostream>
#include <string>

#include "TutorialConfig.h"

// TODO 11: Only include MathFunctions if USE_MYMATH is defined
#ifdef USE_MYMATH
#include "MathFunctions.h"
#endif

// TODO 5: Include MathFunctions.h
//#include "MathFunctions.h"

int main(int argc, char* argv[])
{
  if (argc < 2) {
    // report version
    std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR << "."
              << Tutorial_VERSION_MINOR << std::endl;
    std::cout << "Usage: " << argv[0] << " number" << std::endl;
    return 1;
  }

  // convert input to double
  const double inputValue = std::stod(argv[1]);

  // TODO 12: Use mysqrt if USE_MYMATH is defined and sqrt otherwise
#ifdef USE_MYMATH
    const double outputValue=mysqrt(inputValue);
#else
    const double outputValue= sqrt(inputValue);
#endif

  // TODO 6: Replace sqrt with mysqrt
//  const double outputValue=mysqrt(inputValue);

  // calculate square root
//  const double outputValue = sqrt(inputValue);
  std::cout << "The square root of " << inputValue << " is " << outputValue
            << std::endl;
  return 0;
}
