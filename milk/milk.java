/*
  AUTHOR:wind1740
  LANG:JAVA
  PROG:milk
*/
import java.util.*;
import java.io.*;

public class milk
{
  private static int sum,n;
  private static int[] cost=new int[10000];
  private static int[] amount=new int [10000];
    

  public static void qsort(int beg,int ed)
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

  public static void main(String[] args) throws FileNotFoundException

  { 
    Scanner in=new Scanner (new File("milk.in"));
    PrintWriter out=new PrintWriter (new File ("milk.out"));
  
    int k,now,summ;
    sum=in.nextInt();
	n=in.nextInt();
    in.nextLine();
    for (int i=1;i<=n;i++)
    {	  
      cost[i]=in.nextInt();
	  amount[i]=in.nextInt();
      in.nextLine();
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
    out.println(summ);
    in.close();
    out.close();
  }
}

