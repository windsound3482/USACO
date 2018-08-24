{
  AUTHOR:wind1740
  LANG:PASCAL
  PROG:friday
}

var n:longint;
    day:array [0..6] of longint;
	now:longint;
	
const	
	mt:array [1..12] of longint=(31,28,31,30,31,30,31,31,30,31,30,31);
	
procedure check(nn:longint);
var flag:boolean;
    i:longint;
begin
  if (nn mod 400=0) or ((nn mod 100<>0) and (nn mod 4=0)) then
    flag:=true
  else
    flag:=false;
  {for each month}
  for i:=1 to 12 do begin
    now:=(now+12) mod 7;
	inc(day[now]); 
	inc(now,mt[i]-12);
	if (flag=true) and (i=2) then
	  inc(now);
  end;
end;

procedure main(nn:longint);
var i:longint;
begin
  now:=1;
  for i:=1900 to (1900+nn-1) do 
  begin
    check(i);
  end;
  write (day[6],' ');
  for i:=0 to 4 do 
    write (day[i],' ');
  writeln (day[5]); 
end;

begin
  assign (input,'friday.in');
  assign (output,'friday.out');
  reset (input);
  rewrite (output);
  
  readln (n);
  main(n);
  
  close(input);
  close(output);
end.  