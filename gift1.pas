{
  Author:wind1740
  LANG: PASCAL
  PROG:gift1
}
var mon:array [1..10000] of longint;
    name:array [1..10000] of string;
    n:longint;

function check(strr:string):longint;
var i:longint;
begin
  check:=1;
  for i:=1 to n do
    if name[i]=strr then exit(i);
end;
	
procedure divv(strr:string;num,peop:longint);
var i,j,k:longint;
    p:string;
begin
  i:=check(strr);
  if peop<>0 then
  begin
    mon[i]:=mon[i]-num+num mod peop;
    k:=num div peop;
  end;
  for j:=1 to peop do 
  begin
    readln (p);
	inc (mon[check(p)],k);
  end;
end;
	
procedure main;
var i:longint;
    str:string;
	numm,peo:longint;
begin
  readln (n);
  for i:=1 to n do 
  begin
    readln (name[i]);
  end;
  fillchar (mon,sizeof(mon),0);
  for i:=1 to n do
  begin
    readln (str);
	readln (numm,peo);
	divv(str,numm,peo);
  end;
  for i:=1 to n do 
  begin
    writeln (name[i],' ',mon[i]);
  end;
end;
	
begin
  assign (input,'gift1.in');
  assign (output,'gift1.out');
  reset (input);
  rewrite (output);
  
  main;
  
  close (input);
  close (output);
end.