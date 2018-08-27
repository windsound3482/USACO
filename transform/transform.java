/*
  Author:wind1740
  LANG:JAVA
  PROG:transform
*/
import java.util.*;
import java.io.*;


public class transform
{

  private static int n;

  private static char[][] a=new char[100][100];
  private static char[][] b=new char[100][100];

  public static char[][] mir(char[][] now)
  {
    char[][] after=new char[100][100];

    for (int i=1;i<=n;i++)
    {
	  
      for (int j=1;j<=n;j++) 
	    after[i][n-j+1]=now[i][j];
    }
    return (after);
  }
  
  public static char[][] rt(char[][] now)
  {
    char[][] after=new char[100][100];
    for (int j=1;j<=n;j++) 
    {
	
      for (int i=1;i<=n;i++) 
	    after[j][n-i+1]=now[i][j];
    }
    return(after);
  }

  public static boolean equall(char[][] map1,char[][] map2)

  {
  		
    boolean flag=true;
    for (int j=1;j<=n;j++)	  
      for (int i=1;i<=n;i++)
	    if (map1[i][j]!=map2[i][j]) flag=false;
    return(flag);
  }	
	
  public static int check()
  {
 

  
    char[][] rt_90=rt(a);
    if (equall(b,rt_90)==true) return(1);
  
    char[][] rt_180=rt(rt_90);
    if (equall(b,rt_180)==true) return(2);
  
    char[][] rt_270=rt(rt_180);
    if (equall(b,rt_270)==true) return(3);
  
    if (equall(b,mir(a))==true)  return (4);
  
    if ((equall(b,mir(rt_90))==true) || (equall(b,mir(rt_180))==true) || (equall(b,mir(rt_270))==true)) 
    return (5);
	
    if (equall(b,a)==true)  return (6);
  
    return(7);
  }
  
  public static char[] succ(char[] von)
  {
	  char[] bis=new char[100];
	  for (int i=1;i<=n;i++)
	     bis[i]=von[i-1];
	  return(bis);
  }
	
  public static void main(String[] args) throws FileNotFoundException
  {
	
    Scanner in=new Scanner(new File("transform.in"));
    PrintWriter out=new PrintWriter(new File("transform.out"));
    String temp;
    n=in.nextInt();
  
    in.nextLine();
    for (int i=1;i<=n;i++) 
    {
	  
	  temp=in.nextLine();
      a[i]=temp.toCharArray();
      a[i]=succ(a[i]);
    }

  

    for (int i=1;i<=n;i++) 
    {
      temp=in.nextLine();
      b[i]=temp.toCharArray();
	  b[i]=succ(b[i]);
    }
  
    out.println(check());
    in.close();
    out.close();
  }
}
