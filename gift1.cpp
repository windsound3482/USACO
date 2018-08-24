/*
  Author:wind1740
  LANG: C++
  PROG: gift1
*/

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

  int n;
  int mon[10000];
  string name[10000];
  ifstream in("gift1.in");
  ofstream out("gift1.out");

int check(string strr)
{

  
  for (int i=1;i<=n;i++)
  {
    if (name[i]==strr) return (i);
  }
  return(0);
}
  
void divv(string strr,int num,int peop)
{
  int i=check(strr);
  int k;
  if (peop!=0) 
  {
    mon[i]=mon[i]-num+num%peop;
	
    k=(int)num/peop;
  }
  for (int j=1;j<=peop;j++)
  {
	string p;
    getline (in,p);
	mon[check(p)]+=k;
  }

}

int main()
{
	in >> n;
	while (in.get() != '\n') ;
	for (int i=1;i<=n;i++)
	{
		getline(in,name[i]);
	}
	string str;
	for (int i=1;i<=n;i++)
	{
		getline(in,str);
		int numm, peo;
		in >> numm >> peo;
		while (in.get()!='\n');
		divv(str,numm,peo);
	}
	for (int i=1;i<=n;i++)
    {
    out << name[i] << ' ' << mon[i] <<endl;
    }
	return (0);
	in.close();
	out.close();
    
}