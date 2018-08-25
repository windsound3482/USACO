{
  Author:wind1740
  LANG:PASCAL
  PROG:transform
}

type 
  map=array [1..100,1..100] of char;

var n:longint;
    a:map;
    b:map;

function mir(now:map):map;
var i,j:longint;
    after:map;
begin
  for i:=1 to n do
    for j:=1 to n do 
	  after[i,n-j+1]:=now[i,j];
  exit (after);
end;
  
function rt(now:map):map;  
var i,j:longint;
    after:map;
begin
  for j:=1 to n do
    for i:=1 to n do
	  after[j,n-i+1]:=now[i,j];
  exit(after);
end;

function equall(map1,map2:map):boolean;
var i,j:longint;
    flag:boolean;
begin
  flag:=true;
  for i:=1 to n do
    for j:=1 to n do
	  if map1[i,j]<>map2[i,j] then flag:=false;
  exit(flag);
end;	
	
function check:longint;
var rt_90,rt_180,rt_270:map;
begin
  
  rt_90:=rt(a);
  if equall(b,rt_90) then exit(1);
  
  rt_180:=rt(rt_90);
  if equall(b,rt_180) then exit(2);
  
  rt_270:=rt(rt_180);
  if equall(b,rt_270) then exit(3);
  
  if equall(b,mir(a)) then exit (4);
  
  if equall(b,mir(rt_90)) or equall(b,mir(rt_180)) or equall(b,mir(rt_270)) then
    exit (5);
	
  if equall(b,a) then exit (6);
  
  exit(7);
end;
	
procedure main;
var i,j:longint;
begin
  readln (n);
  for i:=1 to n do 
  begin
    for j:=1 to n do 
      read(a[i,j]);
  readln;
  end;
  for i:=1 to n do 
  begin
    for j:=1 to n do 
      read(b[i,j]);
    readln;
  end;
  writeln (check);
end;

begin
  assign (input,'transform.in');
  assign (output,'transform.out');
  reset (input);
  rewrite (output);
  
  main;
  
  close(input);
  close(output);
end.