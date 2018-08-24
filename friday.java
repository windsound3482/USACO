/*
  AUTHOR:wind1740
  LANG:JAVA
  PROG:friday
*/

import java.io.*;
import java.util.*;

public class friday
{
  private static int n;
  private static int[] day=new int[7];
  private static int now;
  private static Scanner sc;
  private static PrintWriter pw;
	
  final private static int[] mt={31,28,31,30,31,30,31,31,30,31,30,31};

  public static void check(int nn)
  {
    boolean flag;

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

  public static void main(String[] args) throws FileNotFoundException
  {
	sc=new Scanner(new File("friday.in"));
	pw=new PrintWriter (new File("friday.out"));
	n=sc.nextInt();
	now=1;
	for (int i=1900;i<=(1900+n-1);i++)
	{
		check(i);
	}
	pw.print ((day[6])+" ");
    for (int i=0;i<=4;i++) 
      pw.print ((day[i])+" ");
    pw.println(day[5]); 
	sc.close();
	pw.close();
  }
}