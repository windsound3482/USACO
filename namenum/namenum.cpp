/*
  Author:win1740
  LANG:C++
  PROG:namenum
*/

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int n;
int check[20];
bool flag;

ifstream in;
ofstream out("namenum.out");


bool checkchar(char now,int orig)
{
  if ((orig<=6) && (((int)now>((int)'C'+orig*3-6)) || ((int)now<((int)'A'+orig*3-6))))
    return (false);
  if ((orig==7) && ((now!='P') && (now!='R') && (now!='S'))) 
    return (false);
  if ((orig==8) && ((now!='T') && (now!='U') && (now!='V'))) 
    return (false);
  if ((orig==9) && ((now!='W') && (now!='X') && (now!='Y'))) 
    return (false);	
  return (true);
}
	
bool checkit(string now)
{
 
  for (int i=0;i<n;i++) 
 
    if (checkchar(now[i],check[i])==false) 
    	return (false);

  return(true);
}
	
void doit()
{
  string now;

  while (not in.eof()) 
  {
    getline(in,now);
    if ((n==(signed)now.length()) && (checkit(now)==true) )
	{
	  out << now <<endl;
	  flag=true;
	}
  }
}

void init()
{
  string str;
  getline(in,str);
  n=str.length();
  for (int i=0;i<=n;i++) 
  {
    check[i]=(int)str[i]-(int)'0';
  }  
}

int main()
{
  in.open ("namenum.in");
  
  init();
  
  in.close();

  in.open ("dict.txt");
  

  

  flag=false;
  
  
  doit();
  
  if (flag==false)
    out << "NONE" <<endl;
 
  in.close();
  out.close();
  
}