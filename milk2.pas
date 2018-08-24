{
  Author:wind1740
  LANG:PASCAL
  PROG:milk2
  like a chain but with array
}
var von,wert,zu:array [0..10000] of longint;
    tim:longint;
	mk,nmk:longint;

function check(wh:longint):longint;
var now:longint;
begin
  now:=0;
  while wert[zu[now]]<=wh do 
  begin
    now:=zu[now];
	inc(tim);
  end;
  exit(now);
end;

procedure find;
var now,i:longint;
    temp1,temp2:longint;
	flag:boolean;
begin
  now:=0;
  nmk:=0;
  mk:=0;
  flag:=true;
  now:=zu[now];
  temp1:=0;
  temp2:=0;
  while zu[now]<>6000 do
  begin
    
    now:=zu[now];
	
	i:=wert[now]-wert[von[now]];	
    if flag=true then
	begin
	  if wert[von[now]]=wert[von[von[now]]] then
	    inc(i,temp1);
	  temp1:=i;
      if mk<i then mk:=i;
	end
	else
	begin
	  if wert[von[now]]=wert[von[von[now]]] then
	    inc(i,temp2);
	  temp2:=i;
	  if nmk<i then nmk:=i;
	end;
	flag:=not flag;
  end;
end;  
  
procedure main;
var i,j:longint;
    n:longint;
	v,z,ed:longint;
	tempv,tempz:longint;
begin
  readln (n);
  readln (v,z);
  zu[0]:=1;
  von[1]:=0;wert[1]:=v;zu[1]:=2;
  von[2]:=1;wert[2]:=z;zu[2]:=6000;
  wert[6000]:=9999999;
  ed:=2;
  for i:=1 to (n-1) do begin
    readln (v,z);
	
	tim:=0;
	j:=check(z);
	if tim mod 2=1 then
	  tempz:=zu[j]
	else
	begin
	  inc(ed);
	  zu[ed]:=zu[j];
	  von[zu[j]]:=ed;
	  wert[ed]:=z;
	  tempz:=ed;
	end;
	
	tim:=0;
    j:=check(v);
	if tim mod 2=1 then 
	  tempv:=j
	else 
	begin
	  inc(ed);
	  von[ed]:=j;
	  zu[j]:=ed;
	  wert[ed]:=v;
	  tempv:=ed;
	end;
    
	zu[tempv]:=tempz;
	von[tempz]:=tempv;
  end;

  find;
	
  writeln (mk,' ',nmk);
end;

begin
  assign (input,'milk2.in');
  assign (output,'milk2.out');
  reset (input);
  rewrite (output);
  
  main;
  
  close (input);
  close (output);
end.