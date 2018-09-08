/*
  AUTHOR:wind1740
  LANG:C++
  PROG:milk
*/
#include <iostream>
#include <fstream>
using namespace std;
int sum,n;
int cost[10000],amount[10000];
    

void qsort(int beg,int ed)
{
  int l,r,mid,temp;
  l=beg;
  r=ed;
  mid=cost[(int)(l+r)/2];
  while (l<r)  
  {
    while (cost[l]<mid) 
	  l++;
	while (cost[r]>mid) 
	  r--;
	if (l<=r) 
	{
	  temp=cost[l];
	  cost[l]=cost[r];
	  cost[r]=temp;
	  temp=amount[l];
	  amount[l]=amount[r];
	  amount[r]=temp;
	  l++;
	  r--;
	}
  }
  if (l<ed) 
	  qsort(l,ed);
  if (r>beg)
	  qsort(beg,r);  
}

int main()

{ 
  ifstream in ("milk.in");
  ofstream out ("milk.out");
  
  int k,now,summ;
  in >> sum >> n;
  while (in.get()!='\n');
  for (int i=1;i<=n;i++)
  {	  
    in >> cost[i] >> amount[i];
	while (in.get()!='\n');
  }	
  qsort(1,n);
  k=sum;
  now=0;
  summ=0;
  while (k>0)  
  {
    now++;
    if (amount[now]<k)  
	{
	  summ+=cost[now]*amount[now];
	  k-=amount[now];
	}
	else
	{
	  summ+=cost[now]*k;
	  k=0;
	}
  }
  out << summ << endl;
  in.close();
  out.close();
}

