/*
  AUTHOR:wind1740
  LANG:JAVA
  PROG:dualpal
  Why i want to do a programm before take the flight....
*/
import java.util.*;
import java.io.*;

public class dualpal
{
  private static int n,s,now;
  private static int len_base;

  public static boolean check(int[] was)
  {
    for (int i=1;i<=((int)len_base/2);i++)
      if (was[i]!=was[len_base-i+1]) 
		  return (false);
    return (true);	
  }
	
  public static boolean squ(int bef)
  {
    int[] after=new int[1000];
  
    int i,j;
    int time=0;
  
    for (int k=2;k<=10;k++)
    {
      i=bef;
      j=0;
      while (i!=0) 
      {
        j++;
        after[j]=i%k;
  	    i=(int)i/k;
      } 
      len_base=j;
      if (check(after)==true)
      {
        time++;
      }  
      if (time==2)
		  return (true);
    }
    return (false);
  }
	
  public static void main(String[] args) throws FileNotFoundException
  {
    boolean flag;
    Scanner in=new Scanner (new File("dualpal.in"));
    PrintWriter out=new PrintWriter (new File("dualpal.out"));
    n=in.nextInt();
	s=in.nextInt();
	in.nextLine();
  
    now=s;
    for (int i=1;i<=n;i++)
    {
      flag=false;
      while (flag==false) 
      {  
	    now++;
	    if (squ(now)==true)  
	    {
	      out.println(now);
	      flag=true;
	    }
	  }  
    }
    in.close();
    out.close();
  }
}