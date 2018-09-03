/*
  AUTHOR:wind1740
  LANG:C++
  PROG:dualpal
*/
#include <iostream>
#include <fstream>
using namespace std;
typedef int *wass;

int n,s,now;
int len_base;

bool check(wass was)
{
  for (int i=1;i<=((int)len_base/2);i++)
    if (was[i]!=was[len_base-i+1]) 
		return (false);
  return (true);	
}
	
bool squ(int bef)
{
  wass after=new int[1000];
  
  int i,j;
  int time=0;
  
  for (int k=2;k<=10;k++)
  {
    i=bef;
    j=0;
    while (i!=0) 
    {
      j++;
      after[j]=i%k;
  	  i=(int)i/k;
    } 
    len_base=j;
    if (check(after)==true)
    {
      time++;
    }  
    if (time==2)
		return (true);
  }
  return (false);
}
	
int main()

    
	
{
  bool flag;
  ifstream in ("dualpal.in");
  ofstream out ("dualpal.out");
  in >> n >> s;
  while (in.get()!='\n');
  now=s;
  for (int i=1;i<=n;i++)
  {
    flag=false;
    while (flag==false) 
    {  
	  now++;
	  if (squ(now)==true)  
	  {
	    out << now <<endl;
	    flag=true;
	  }
	}
  }
  in.close();
  out.close();
}
