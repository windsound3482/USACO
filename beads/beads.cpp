/*
  AUTHOR:wind1740
  LANG:C++
  PROG:beads
*/
#include <iostream>
#include <fstream>
using namespace std;

int last,now,num;
bool flag;
int	maxx;
string chain;
int	w;
char r;

void check()
{
  if (((flag==true)&&(r=='b'))||((flag==false)&&(r=='r')))
  {
    //writeln (last,' ',now);
	if (maxx<(last+now))
       maxx=last+now;
	last=now-w;
	now=w+1;
	w=0;
	flag=not flag;
  }
  else
  if (r=='w')
  {
	w++;
	now++;
  }
  else
  {
	w=0;
	now++;
  }
}	
	
int main()
{
  ifstream in("beads.in");
  ofstream out("beads.out");
  
  flag=true;
  maxx=0;
  in >> num;
  while (in.get()!='\n');
  in >> chain;
 
  for (int j=1;j<=2;j++)
    for (int i=1;i<=num;i++)
    {
      r=chain[i-1];   
      check();
    }
  if (maxx<(last+now)) 
	  maxx=(int)(last+now)/2;
  if (maxx>num)
	  maxx=num; 
  out << maxx <<endl;
  in.close();
  out.close();
}
  