/*
  Author:wind1740
  LANG:C++
  PROG:crypt1
*/
#include <math.h>
#include <iostream>
#include <fstream>
using namespace std;

int n;
int map[100],mapp[100];
int sum;

	
bool checkk(int x)
{
  for (int i=1;i<=n;i++) 
  {
    if (map[i]==x)
		return (true);
  }
  return (false);
}

bool check(int x,int y)
{
  if (x>=pow (10,y))
	  return (false);
  if (x<pow (10,y-1))
	  return (false);
  int i=x;
  while (i!=0) 
  {
    if (checkk(i%10)==false)
		return (false);
    i=(int)i/10;
  }
  return (true);
}

void pro(int now)

{
  if (now==6) 
  {
    if (check((10*mapp[4]+mapp[5])*(100*mapp[1]+10*mapp[2]+mapp[3]),4)==true)
	{
      sum++;
	  
	}
  }
  else
  {
    for (int i=1;i<=n;i++) 
    {
      mapp[now]=map[i];
  	  if ((now==4) || (now==5))
	  {
	    if (check(mapp[now]*(100*mapp[1]+10*mapp[2]+mapp[3]),3)==true)
			pro(now+1);
      }
      else
	  {
        pro(now+1);
	  }
    }
  }
}
	
int main()
{
  ifstream in ("crypt1.in");
  ofstream out ("crypt1.out");
  in >> n;
  while (in.get()!='\n');
  for (int i=1;i<=n;i++)
    in >> map[i];  
  while (in.get()!='\n');
  sum=0;
  pro(1);
  
  out << sum <<endl;
  in.close ();
  out.close ();
}
