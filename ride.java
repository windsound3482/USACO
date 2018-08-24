/*
ID: wind1740
LANG: JAVA
PROG: ride 
*/

import java.io.*;
import java.util.*;



public class ride
{
	public static int num(String strr)
	{
		int j=1;
		for (int i=0;i<strr.length();i++)
		{
			
			j=j*(((int)strr.charAt(i) -(int)'A'+1)%47)%47;
		}
		return (j);
	}
	public static void main(String[] args) throws FileNotFoundException
    {
		Scanner sc = new Scanner(new File ("ride.in"));
		Formatter out = new Formatter(new File("ride.out"));
		
		String str1=sc.nextLine();
		String str2=sc.nextLine();
		
		
		
		if (num(str1)==num(str2))
		{
			out.format("GO%n");
		}
		else
		{
			out.format("STAY%n");
		}
		sc.close();
		out.close();
	}
}