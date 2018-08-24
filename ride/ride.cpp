/*
ID: wind1740
LANG: C++
PROG: ride 
*/
#include <iostream>
#include <fstream>
#include <string.h>

using namespace std;

int num(char strr[100])
{
	int j=1;
	int k=strlen (strr);
	for (int i=0;i<k;i++)
	{
		j=j*(((int)strr[i]-(int)'A'+1)%47)%47;
	}
	return (j);
}

int main()
{
	ifstream in("ride.in");
	ofstream out("ride.out");
	char str1[100],str2[100];
	
    in.getline (str1,100);
	in.getline (str2,100);
		
	if (num(str1)==num(str2))
	{
		out << "GO" <<endl;
	}
	else
	{
		out << "STAY" <<endl;
	}
	in.close();
	out.close();
}