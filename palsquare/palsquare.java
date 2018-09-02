/*
  AUTHOR:wind1740
  LANG:JAVA
  PROG:palsquare
*/
import java.util.*;
import java.io.*;

public class palsquare{
  private static int n;
  private static int len_squ_base,len_ori_base;

  public static boolean check(int[] was)

  {
    for (int i=1;i<=((int)len_squ_base/2);i++)
      if (was[i]!=was[len_squ_base-i+1])  
        return (false);
    return (true);	
  }
	
  public static int[] squ(int bef,boolean flag)

   
  {
    int i,j;
    int[] after=new int[1000];
    i=bef;
    j=0;
    while (i!=0) 
    {
      j++;
      after[j]=i%n;
	  i=(int)i/n;
    }
    if (flag==true)  
      len_squ_base=j;
    else
      len_ori_base=j;
    return(after);
  }
	
  public static void main(String[] args) throws FileNotFoundException
  {
    Scanner in=new Scanner(new File("palsquare.in"));
    PrintWriter out=new PrintWriter(new File ("palsquare.out"));
    int[] squ_base,ori_base;
    n=in.nextInt();
    in.nextLine();
    for (int i=1;i<=300;i++) 
    {
      squ_base=squ(i*i,true);
	  if (check(squ_base)==true)  
	  {
	    ori_base=squ(i,false);
	    for (int j=len_ori_base;j>=1;j--)
        {	  
	      if (ori_base[j]<=9)
			  out.print(ori_base[j]);
         else 
			  out.print((char)((int)'A'+ori_base[j]-10));
		
	    }
	    out.print(" ");
	    for (int j=len_squ_base;j>=1;j--)
	    {	  
	      if (squ_base[j]<=9)  
		      out.print(squ_base[j]);
	      else 
			  out.print((char)((int)'A'+squ_base[j]-10));
		
	    }  
	    out.println();
	  }
    }
    in.close();
    out.close();
  }
}

