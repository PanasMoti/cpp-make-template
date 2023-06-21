
#include <iostream>
#include "example.hpp"
int main(int argc,char** argv) {
	//std::cout << "Hello World!" << std::endl;
	std::cout << readFromFile("res/example.txt") << std::endl;
	return 0;
}
