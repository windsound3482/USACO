{
  AUTHOR:wind1740
  LANG:PASCAL
  PROG:palsquare
}

type
  wass=array [1..1000] of longint;

var n:longint;
    len_squ_base,len_ori_base:longint;

function check(was:wass):boolean;
var i:longint;
begin
  for i:=1 to (len_squ_base div 2) do
    if was[i]<>was[len_squ_base-i+1] then exit (false);
  exit (true);	
end;
	
function squ(bef:longint;flag:boolean):wass;
var after:wass;
    i,j:longint;
begin
  i:=bef;
  j:=0;
  while i<>0 do 
  begin
    inc(j);
    after[j]:=i mod n;
	i:=i div n;
  end;
  if flag=true then 
    len_squ_base:=j
  else
    len_ori_base:=j;
  exit(after);
end;
	
procedure main;
var i,j:longint;
    squ_base,ori_base:wass;
	
begin
  readln (n);
  for i:=1 to 300 do begin
    squ_base:=squ(i*i,true);
	if check(squ_base)=true then 
	begin
	  ori_base:=squ(i,false);
	  for j:=len_ori_base downto 1 do
      begin	  
	    if ori_base[j]<=9 then write (ori_base[j])
	                      else write (chr(ord('A')+ori_base[j]-10))
		
	  end;
	  write (' ');
	  for j:=len_squ_base downto 1 do
	  begin	  
	    if squ_base[j]<=9 then write (squ_base[j])
	                      else write (chr(ord('A')+squ_base[j]-10))
		
	  end;  
	  writeln;
	end;
  end;
end;

begin
  assign (input,'palsquare.in');
  assign (output,'palsquare.out');
  reset (input);
  rewrite (output);
  main;
  close (input);
  close(output);
end.