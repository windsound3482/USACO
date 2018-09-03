{
  AUTHOR:wind1740
  LANG:PASCAL
  PROG:dualpal
}

type
  wass=array [1..1000] of longint;

var n,s,now:longint;
    len_base:longint;

function check(was:wass):boolean;
var i:longint;
begin
  for i:=1 to (len_base div 2) do
    if was[i]<>was[len_base-i+1] then exit (false);
  exit (true);	
end;
	
function squ(bef:longint):boolean;
var after:wass;
    i,j,k:longint;
	time:longint;
begin
  time:=0;
  for k:=2 to 10 do begin
    i:=bef;
    j:=0;
    while i<>0 do 
    begin
      inc(j);
      after[j]:=i mod k;
  	  i:=i div k;
    end; 
    len_base:=j;
    if check(after)=true then
    begin
      inc(time);
    end;  
    if time=2 then exit (true);
  end;
  exit (false);
end;
	
procedure main;
var i:longint;
    
	flag:boolean;
begin
  readln (n,s);
  now:=s;
  for i:=1 to n do begin
    flag:=false;
    while flag=false do 
    begin  
	  inc(now);
	  if squ(now)=true then  
	  begin
	    writeln (now);
	    flag:=true;
	  end;
	end;
  end;
end;

begin
  assign (input,'dualpal.in');
  assign (output,'dualpal.out');
  reset (input);
  rewrite (output);
  main;
  close (input);
  close(output);
end.