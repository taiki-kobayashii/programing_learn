#include<iostream>

int main(){
	int a, b;
	std::cin >> a >> b;
	std::string text;

	if (a > b) {
		text = "a > b";
	} else if (a < b) {
		text = "a < b";
	} else {
		text = "a = b";
	}

	std::cout << text << std::endl;

	return 0;
}
