/*
  Author:wind1740
  LANG: JAVA
  PROG: gift1
*/

import java.util.*;
import java.io.*;

public class gift1 
{
	public static int n;
	public static String[] name=new String[10000];
    public static int[] mon=new int[10000];
	public static Scanner sc;
	public static PrintWriter out;
	
	public static int check(String str)
	{
		
	    
		for (int i=1;i<=n;i++)
		{
			
			if (name[i].equals(str)==true) 
			{
				return i;
				
			
            }				
		}
		return(0);
	}

	
	public static void divv(String strr, int num, int peop)
    {
		
		int i=check(strr);
		
        int k=0;
        if (peop!=0) 
        {
           mon[i]=mon[i]-num+num%peop;
	 
           k=(int)num/peop;
        }
        for (int j=1;j<=peop;j++)
        {
	       String p=sc.nextLine ();
	       mon[check(p)]+=k;
        }

    }
	
	public static void main(String[] args) throws FileNotFoundException
	{
		sc= new Scanner(new File("gift1.in"));
		out=new PrintWriter(new File("gift1.out"));
		n=sc.nextInt();
		sc.nextLine();
	    for (int i=1;i<=n;i++)
        {
			name[i]=sc.nextLine();
		}			
		
		for (int i=1;i<=n;i++)
		{
			String str= sc.nextLine(); 
			
			int numm= sc.nextInt();
			int peo= sc.nextInt();
			sc.nextLine();
			
			divv(str, numm, peo);
			
		}
		
		for (int i=1;i<=n;i++)
        {
          out.println (name[i]+' '+mon[i]);
        }
		sc.close();
		out.close();
	}
}