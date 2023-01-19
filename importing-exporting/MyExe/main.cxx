// A simple program that outputs a file with the given name
#include <fstream>
#include <iostream>

int main(int argc, char* argv[])
{
  std::ofstream outfile("main.cc");
  outfile << "#include <bits/stdc++.h>" <<std::endl;
  outfile << "int main(int argc, char* argv[])" << std::endl;
  outfile << "{" << std::endl;
  outfile << "  std::cout<<1111111111111111<<std::endl;" << std::endl;
  outfile << "  std::cout<<1111111111111111<<std::endl;" << std::endl;
  outfile << "  std::cout<<1111111111111111<<std::endl;" << std::endl;
  outfile << "  std::cout<<1111111111111111<<std::endl;" << std::endl;
  outfile << "  std::cout<<1111111111111111<<std::endl;" << std::endl;
  outfile << "  return 0;" << std::endl;
  outfile << "}" << std::endl;
  outfile.close();

  return 0;
}
