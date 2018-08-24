/*
  Author:wind1740
  LANG:JAVA
  PROG:milk2
  like a chain but with array
*/
import java.io.*;
import java.util.*;

public class milk2
{
  private static int[] von=new int[100000];
  private static int[] wert=new int[10000];
  private static int[] zu=new int[10000];
  private static int tim;
  private static int mk,nmk;

  public static int check(int wh)
  {
    int now=0;
    while (wert[zu[now]]<=wh) 
    {
      now=zu[now];
	  tim++;
    }
    return(now);
  }

  public static void find()
  {
    int now,i;
    int temp1,temp2;
    boolean flag;

    now=0;
    nmk=0;
    mk=0;
    flag=true;
    now=zu[now];
    temp1=0;
    temp2=0;
    while (zu[now]!=6000)
    {
    
      now=zu[now];
	
	  i=wert[now]-wert[von[now]];	
      if (flag==true)
	  {
	    if (wert[von[now]]==wert[von[von[now]]])
	      i+=temp1;
	    temp1=i;
        if (mk<i) mk=i;
	  }
	  else
	  {
	    if (wert[von[now]]==wert[von[von[now]]])
	      i+=temp2;
	    temp2=i;
	    if (nmk<i) nmk=i;
	  }
	  flag=!flag;
    }
  }  
  
  public static void main(String[] args) throws FileNotFoundException
  {
    Scanner in=new Scanner (new File("milk2.in"));
    PrintWriter out=new PrintWriter (new File("milk2.out"));
  
    int j;
    int n;
    int v,z;
    int ed,tempv,tempz;

    n=in.nextInt();
    in.nextLine();
    v=in.nextInt();
	z=in.nextInt();
    in.nextLine();
    zu[0]=1;
    von[1]=0;wert[1]=v;zu[1]=2;
    von[2]=1;wert[2]=z;zu[2]=6000;
    wert[6000]=9999999;
    ed=2;
    for (int i=1;i<=n-1;i++)
    {
      v=in.nextInt();
	  z=in.nextInt();
      in.nextLine();
	
	
	  tim=0;
	  j=check(z);
	  if (tim%2==1)
	    tempz=zu[j];
	  else
	  {
	    ed++;
	    zu[ed]=zu[j];
	    von[zu[j]]=ed;
	    wert[ed]=z;
	    tempz=ed;
	  }
	
	  tim=0;
      j=check(v);
	  if (tim%2==1) 
	    tempv=j;
	  else 
	  {
	    ed++;
	    von[ed]=j;
	    zu[j]=ed;
	    wert[ed]=v;
	    tempv=ed;
	  }
    
	  zu[tempv]=tempz;
	  von[tempz]=tempv;
    }

    find();
	
    out.println(mk+" "+nmk);
    in.close();
    out.close();
  }
}