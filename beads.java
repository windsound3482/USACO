/*
  AUTHOR:wind1740
  LANG:JAVA
  PROG:beads
*/
import java.io.*;
import java.util.*;

public class beads
{
  private static int last,now,num;
  private static boolean flag;
  private static int	maxx;
  private static String chain;
  private static int	w;
  private static char r;

  public static void check()
  {
    if (((flag==true)&&(r=='b'))||((flag==false)&&(r=='r')))
    {
      //writeln (last,' ',now);
	  if (maxx<(last+now))
         maxx=last+now;
	  last=now-w;
	  now=w+1;
	  w=0;
	  flag=!flag;
    }
    else
    if (r=='w')
    {
	  w++;
	  now++;
    }
    else
    {
	  w=0;
	  now++;
    }
  }	
	
  public static void main(String[] args) throws FileNotFoundException
  {
    Scanner sc=new Scanner(new File ("beads.in"));
    PrintWriter pw=new PrintWriter(new File("beads.out"));
  
    flag=true;
    maxx=0;
    num=sc.nextInt();
    sc.nextLine();
    chain=sc.nextLine();
 
    for (int j=1;j<=2;j++)
      for (int i=1;i<=num;i++)
      {
        r=chain.charAt(i-1);   
        check();
      }
    if (maxx<(last+now)) 
  	  maxx=(int)(last+now)/2;
    if (maxx>num)
	  maxx=num; 
    pw.println (maxx);
    sc.close();
    pw.close();
  }
}
  