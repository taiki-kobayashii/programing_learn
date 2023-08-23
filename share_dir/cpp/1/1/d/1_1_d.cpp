#include <iostream>

int main(){
	int S;
	std::cin >> S;

	int h = S / 3600;
	int m = S % 3600 / 60;
	int s = S % 60;

	std::cout << h << ":" << m << ":" << s << std::endl;

	return 0;
}
