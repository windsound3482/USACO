/*
  AUTHOR:wind1740
  LANG:C++
  PROG:palsquare
*/
#include <iostream>
#include <fstream>
using namespace std;

typedef int *wass;

int n;
int len_squ_base,len_ori_base;

bool check(wass was)

{
  for (int i=1;i<=((int)len_squ_base/2);i++)
    if (was[i]!=was[len_squ_base-i+1])  
      return (false);
  return (true);	
}
	
wass squ(int bef,bool flag)

   
{
  int i,j;
  wass after=new int[1000];
  i=bef;
  j=0;
  while (i!=0) 
  {
    j++;
    after[j]=i%n;
	i=(int)i/n;
  }
  if (flag==true)  
    len_squ_base=j;
  else
    len_ori_base=j;
  return(after);
}
	
int main()
{
  ifstream in ("palsquare.in");
  ofstream out ("palsquare.out");
  wass squ_base,ori_base;
  in >> n;
  while (in.get()!='\n');
  for (int i=1;i<=300;i++) 
  {
    squ_base=squ(i*i,true);
	if (check(squ_base)==true)  
	{
	  ori_base=squ(i,false);
	  for (int j=len_ori_base;j>=1;j--)
      {	  
	    if (ori_base[j]<=9)
			out <<ori_base[j];
        else 
			out <<(char)((int)'A'+ori_base[j]-10);
		
	  }
	  out <<" ";
	  for (int j=len_squ_base;j>=1;j--)
	  {	  
	    if (squ_base[j]<=9)  
		    out << squ_base[j];
	    else 
			out << (char)((int)'A'+squ_base[j]-10);
		
	  }  
	  out <<endl;
	}
  }
  in.close();
  out.close();
}

