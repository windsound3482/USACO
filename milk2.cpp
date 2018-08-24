/*
  Author:wind1740
  LANG:C++
  PROG:milk2
  like a chain but with array
*/
#include <iostream>
#include <fstream>
using namespace std;
long von[10000],wert[10000],zu[10000];
long tim;
long mk,nmk;

long check(long wh)
{
  int now=0;
  while (wert[zu[now]]<=wh) 
  {
    now=zu[now];
	tim++;
  }
  return(now);
}

void find()
{
  long now,i;
  long temp1,temp2;
  bool flag;

  now=0;
  nmk=0;
  mk=0;
  flag=true;
  now=zu[now];
  temp1=0;
  temp2=0;
  while (zu[now]!=6000)
  {
    
    now=zu[now];
	
	i=wert[now]-wert[von[now]];	
    if (flag==true)
	{
	  if (wert[von[now]]==wert[von[von[now]]])
	    i+=temp1;
	  temp1=i;
      if (mk<i) mk=i;
	}
	else
	{
	  if (wert[von[now]]==wert[von[von[now]]])
	    i+=temp2;
	  temp2=i;
	  if (nmk<i) nmk=i;
	}
	flag=not flag;
  }
}  
  
int main()
{
  ifstream in("milk2.in");
  ofstream out("milk2.out");
  
  long j;
  long n;
  long v,z,ed;
  long tempv,tempz;

  in >> n;
  while (in.get()!='\n');
  in >> v >> z;
  while (in.get()!='\n');
  zu[0]=1;
  von[1]=0;wert[1]=v;zu[1]=2;
  von[2]=1;wert[2]=z;zu[2]=6000;
  wert[6000]=9999999;
  ed=2;
  for (int i=1;i<=n-1;i++)
  {
    in >> v >> z;
	while (in.get()!='\n');
	
	tim=0;
	j=check(z);
	if (tim%2==1)
	  tempz=zu[j];
	else
	{
	  ed++;
	  zu[ed]=zu[j];
	  von[zu[j]]=ed;
	  wert[ed]=z;
	  tempz=ed;
	}
	
	tim=0;
    j=check(v);
	if (tim%2==1) 
	  tempv=j;
	else 
	{
	  ed++;
	  von[ed]=j;
	  zu[j]=ed;
	  wert[ed]=v;
	  tempv=ed;
	}
    
	zu[tempv]=tempz;
	von[tempz]=tempv;
  }

  find();
	
  out<< mk << ' ' <<nmk<<endl;
  in.close();
  out.close();
}
