int main() {
	int i = 0;
	int j = i;
	{
		int k = i;
		k++;
	}
	return i;
}
