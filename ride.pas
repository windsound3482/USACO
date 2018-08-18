{
ID: wind1740
PROG: ride 
LANG: PASCAL
}
var str1,str2:string;
	
function num(strr:string):longint;
var i:longint;
begin
  num:=1;
  for i:=1 to length(strr) do 
  begin
    num:=(num*((ord (strr[i])-ord('A')+1) mod 47)) mod 47;
  end;
end;

begin
  assign (input,'ride.in');
  assign (output,'ride.out');
  reset (input);
  rewrite (output);
  readln (str1);
  readln (str2);
  if num(str1)=num(str2) then
    writeln ('GO')
  else
    writeln ('STAY');  
  
  close (input);
  close (output);
  
end.