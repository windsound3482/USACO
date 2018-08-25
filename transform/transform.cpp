/*
  Author:wind1740
  LANG:C++
  PROG:transform
*/
#include <iostream>
#include <fstream>
#include<stdio.h>
using namespace std;

typedef char **map;

int n;

map a=new char*[100];
map b=new char*[100];

map mir(map now)
{
  map after=new char*[100];

  for (int i=1;i<=n;i++)
  {
	after[i]=new char[100];
    for (int j=1;j<=n;j++) 
	  after[i][n-j+1]=now[i][j];
  }
  return (after);
}
  
map rt(map now)
{
  map after=new char*[100];
  for (int j=1;j<=n;j++) 
  {
	after[j]=new char[100];
    for (int i=1;i<=n;i++) 
	  after[j][n-i+1]=now[i][j];
  }
  return(after);
}

bool equall(map map1,map map2)

{
  		
  bool flag=true;
  for (int j=1;j<=n;j++)	  
    for (int i=1;i<=n;i++)
	  if (map1[i][j]!=map2[i][j]) flag=false;
  return(flag);
}	
	
int check()
{
 

  
  map rt_90=rt(a);
  if (equall(b,rt_90)==true) return(1);
  
  map rt_180=rt(rt_90);
  if (equall(b,rt_180)==true) return(2);
  
  map rt_270=rt(rt_180);
  if (equall(b,rt_270)==true) return(3);
  
  if (equall(b,mir(a))==true)  return (4);
  
  if ((equall(b,mir(rt_90))==true) || (equall(b,mir(rt_180))==true) || (equall(b,mir(rt_270))==true)) 
    return (5);
	
  if (equall(b,a)==true)  return (6);
  
  return(7);
}
	
int main()
{
  ifstream in("transform.in");
  ofstream out("transform.out");
  
  in >> n;
  
  while (in.get()!='\n');
  for (int i=1;i<=n;i++) 
  {
	a[i]=new char[100];
    for (int j=1;j<=n;j++)
		in.get(a[i][j]);
    while (in.get()!='\n');
  }

  

  for (int i=1;i<=n;i++) 
  {
      b[i]=new char[100];
      for (int j=1;j<=n;j++)
		in.get(b[i][j]);
	while (in.get()!='\n');
	
  }
  
  out << check() << endl;
  in.close();
  out.close();
}