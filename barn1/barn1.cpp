/*
  Author:wind1740
  LANG:C++
  PROB:barn1
*/
#include <iostream>
#include <fstream>
using namespace std;


int m,s,c;
int	queue[10000],map[10000];
int	total;
ifstream in ("barn1.in");
ofstream out ("barn1.out");

void qsort(int beg, int ed)

{
  int l,r,mid,temp;
  l=beg;
  r=ed;
  mid=queue[(int)(l+r)/2];
  while (l<r)
  {
    while (queue[l]<mid)
	  l++;
	while (queue[r]>mid)
	  r--;
	if (l<=r)
	{
	  temp=queue[l];
	  queue[l]=queue[r];
	  queue[r]=temp;
	 
	  l++;
	  r--;
	}
  }
  if (l<ed)
	  qsort(l,ed);
  if (r>beg)
	  qsort(beg,r);  
}

void qsorts(int beg, int ed)

{
  int l,r,mid,temp;
  l=beg;
  r=ed;
  mid=map[(int)(l+r)/2];
  while (l<r)  
  {
    while (map[l]<mid) 
	  l++;
	while (map[r]>mid)
	  r--;
	if (l<=r)
	{
	  temp=map[l];
	  map[l]=map[r];
	  map[r]=temp;
	 
	  l++;
	  r--;
	}
  }
  if (l<ed) 
	  qsorts(l,ed);
  if (r>beg) 
	  qsorts(beg,r);  
}

void init()
 
{
  int now,thenn,j;
  in >> m >> s >> c;
  while (in.get()!='\n');
  for (int i=1;i<=c;i++) 
  {	  
    in >> map[i];
	while (in.get()!='\n');
  }
  qsorts(1,c);
  j=map[1];
  now=j;
  for (int i=1;i<=(c-1);i++)
  {
    thenn=map[i+1];
	queue[i]=thenn-now;
	now=thenn;
  }	
  total=thenn-j+1;
}
	
int main()

{ 

  
  init();
  qsort(1,c-1);
  if (m>c) 
  {
    out << c <<endl;
  }
  else
  {
    for (int i=1;i<=(m-1);i++)
      total-=queue[c-i];
    out << total+m-1 <<endl;	
  }
  in.close();
  out.close();
}
