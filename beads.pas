{
  AUTHOR:wind1740
  LANG:PASCAL
  PROG:beads
}

var last,now,i,j,num:longint;
    flag:boolean;
	max:longint;
	chain:ansistring;
	w:longint;
    r:char;

procedure check;
begin
  if ((flag=true) and (r='b')) or ((flag=false) and (r='r')) then 
  begin
    //writeln (last,' ',now);
	if max<(last+now) then max:=last+now;
	last:=now-w;
	now:=w+1;
	w:=0;
	flag:=not flag;
  end
  else
  if r='w' then
  begin
	inc(w);
	inc(now);
  end
  else
  begin
	w:=0;
	inc(now);
  end;
end;	
	
begin
  assign (input,'beads.in');
  assign (output,'beads.out');
  reset (input);
  rewrite (output);
  
  flag:=true;
  max:=0;
  readln (num);
  readln (chain);
 
  for j:=1 to 2 do
    for i:=1 to num do
    begin
      r:=chain[i];   
      check;
    end;
  if max<(last+now) then max:=(last+now) div 2;
  if max>i then max:=i; 
  writeln (max);
  close (input);
  close (output);
end.
  