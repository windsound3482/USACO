/*
  AUTHOR:wind1740
  LANG:C++
  PROG:friday
*/

#include <iostream>
#include <fstream>
using namespace std;

int n;
int day[7];
int	now;
ifstream in("friday.in");
ofstream out("friday.out");
	
const int mt[12]={31,28,31,30,31,30,31,31,30,31,30,31};

void check(int nn)
{
  bool flag;

  if ((nn%400==0)||((nn%100!=0)&&(nn%4==0))) 
    flag=true;
  else
    flag=false;
 
  //for each month
  for (int i=1;i<=12;i++)
  {
    now=(now+12)%7;
	day[now]++; 
	now=now+mt[i-1]-12;
	if ((flag==true)&&(i==2))
		now++;
  }
}

int main()
{
	
	in >> n;
	now=1;
	for (int i=1900;i<=(1900+n-1);i++)
	{
		check(i);
	}
	out<< day[6] << ' ';
    for (int i=0;i<=4;i++) 
      out << day[i] <<' ';
    out << day[5] << endl; 
	in.close();
	out.close();
}