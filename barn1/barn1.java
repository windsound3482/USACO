/*
  Author:wind1740
  LANG:JAVA
  PROB:barn1
*/
import java.io.*;
import java.util.*;

public class barn1{
  private static int m,s,c;
  private static int[] queue,map;
  private static int total;
  private static Scanner in;
  private static PrintWriter out;

  private static void qsort(int beg, int ed)
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

  public static void qsorts(int beg, int ed)

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

  public static void init()
 
  {
    int now,thenn,j;
	thenn=0;
    m=in.nextInt();
	s=in.nextInt();
	c=in.nextInt();
    in.nextLine();
    for (int i=1;i<=c;i++) 
    {	  
      map[i]=in.nextInt();
	  in.nextLine();
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
	
  public static void main(String[] args) throws FileNotFoundException

  { 
    in=new Scanner (new File("barn1.in"));
	out=new PrintWriter (new File("barn1.out"));
  
    queue=new int[10000];
	map=new int[10000];
    init();
    qsort(1,c-1);
    if (m>c) 
    {
      out.println(c);
    }
    else
    {
      for (int i=1;i<=(m-1);i++)
        total-=queue[c-i];
      out.println(total+m-1);	
    }
    in.close();
    out.close();
  }
}