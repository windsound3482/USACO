{
  Author:win1740
  LANG:PASCAL
  PROG:namenum
}
var n:longint;
    check:array[1..20] of longint;
	flag:boolean;


function checkchar(now:char;orig:longint):boolean;
begin
  if ((orig<=6) and ((ord (now)>(ord('C')+orig*3-6)) or (ord(now)<(ord('A')+orig*3-6)))) then
    exit (false);
  if (orig=7) and ((now<>'P') and (now<>'R') and (now<>'S')) then
    exit (false);
  if (orig=8) and ((now<>'T') and (now<>'U') and (now<>'V')) then
    exit (false);
  if (orig=9) and ((now<>'W') and (now<>'X') and (now<>'Y')) then
    exit (false);	
    exit (true);
end;
	
function checkit(now:string):boolean;
var i:longint;

begin
 
  for i:=1 to n do 
 
    if checkchar(now[i],check[i])=false then exit (false);

  exit(true);
end;
	
procedure doit;
var now:string;
begin
  while not Eof(input) do begin
    readln (now);
    if (n=length(now)) and (checkit(now)) then
	begin
	  writeln (now);
	  flag:=true;
	end;
  end;
end;

procedure init;
var str:string;
    i:longint;
begin
  readln (str);
  n:=length(str);
  for i:=1 to n do 
  begin
    check[i]:=ord (str[i])-ord('0');
  end;  
end;


begin
  assign (input,'namenum.in');
  reset (input);
  init;

  assign (input,'dict.txt');
  assign (output,'namenum.out');
  reset (input);
  
  rewrite (output);
  flag:=false;
  
  
  doit;
  
  if flag=false then writeln ('NONE');
 
  close (input );
  close (output);
  
end.