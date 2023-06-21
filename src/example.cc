#include "example.hpp"

std::string readFromFile(const std::string& Path)
{
	std::ifstream t(Path);
	t.seekg(0, std::ios::end);
	size_t size = t.tellg();
	std::string buffer(size, ' ');
	t.seekg(0);
	t.read(&buffer[0], size);
	//t.close();
	return buffer;
}

