{
  Author:wind1740
  LANG:PASCAL
  PROG:crypt1
}
uses math;
var n:longint;
    map,mapp:array [1..100] of longint;
	sum:longint;
	
function checkk(x:longint):boolean;
var i:longint;
begin
  for i:=1 to n do 
  begin
    if map[i]=x then exit (true);
  end;
  exit (false);
end;

function check(x,y:longint):boolean;
var i:longint;
begin
  if x>=intpower (10,y) then exit (false);
  if x<intpower (10,y-1) then exit (false);
  i:=x;
  while i<>0 do
  begin
    if checkk(i mod 10)=false then exit (false);
    i:=i div 10;
  end;
  exit (true);
end;

procedure pro(now:longint);
var i:longint;
begin
  if now=6 then 
  begin
    if check((10*mapp[4]+mapp[5])*(100*mapp[1]+10*mapp[2]+mapp[3]),4)=true then
	begin
      inc (sum);
	  
	end;
  end
  else
  begin
    for i:=1 to n do 
    begin
      mapp[now]:=map[i];
  	  if (now=4) or (now=5) then
	  begin
	    if check(mapp[now]*(100*mapp[1]+10*mapp[2]+mapp[3]),3)=true then pro(now+1);
      end
      else
        pro(now+1);
    end;
  end;
end;
	
procedure init;
var i:longint;
begin
  readln (n);
  for i:=1 to n do
    read (map[i]);  
  sum:=0;
  pro(1);

  writeln (sum);
end;

begin
  assign (input,'crypt1.in');
  assign (output,'crypt1.out');
  reset (input);
  rewrite (output);
  
  init;
  
  close (input);
  close (output);
end.