/*
  Author:win1740
  LANG:JAVA
  PROG:namenum
*/

import java.util.*;
import java.io.*;

public class namenum
{
  private static int n;
  private static int[] check=new int[20];
  private static boolean flag;

  private static Scanner in;
  private static PrintWriter out;


  public static boolean checkchar(char now,int orig)
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
	
  public static boolean checkit(String now)
  {
 
    for (int i=0;i<n;i++) 
 
      if (checkchar(now.charAt(i),check[i])==false) 
    	  return (false);

    return(true);
  }
	
  public static void doit()
  {
    String now;

    while (in.hasNext()==true) 
    {
      now=in.nextLine();
      if ((n==now.length()) && (checkit(now)==true) )
	  {
	    out.println(now);
	    flag=true;
	  }
    }
  }

  public static void init()
  {
    String str;
    str=in.nextLine();
    n=str.length();
    for (int i=0;i<n;i++) 
    {
      check[i]=(int)str.charAt(i)-(int)'0';
    }  
  }

  public static void main(String[] args) throws FileNotFoundException
  {
    in=new Scanner (new File("namenum.in"));
    out=new PrintWriter(new File("namenum.out"));
    init();
  
    in.close();

    in=new Scanner (new File("dict.txt"));
  

  

    flag=false;
  
  
    doit();
  
    if (flag==false)
      out.println("NONE");
 
    in.close();
    out.close();
  
  }
}
