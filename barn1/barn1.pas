{
  Author:wind1740
  LANG:PASCAL
  PROB:barn1
}
var i,j:longint;
    m,s,c:longint;
	queue,map:array[1..10000] of longint;
	total:longint;

procedure qsort(beg,ed:longint);
var l,r,mid,temp:longint;
begin
  l:=beg;
  r:=ed;
  mid:=queue[(l+r) div 2];
  while (l<r) do 
  begin
    while (queue[l]<mid) do
	  inc(l);
	while (queue[r]>mid) do
	  dec(r);
	if l<=r then
	begin
	  temp:=queue[l];
	  queue[l]:=queue[r];
	  queue[r]:=temp;
	 
	  inc(l);
	  dec(r);
	end;
  end;
  if l<ed then qsort(l,ed);
  if r>beg then qsort(beg,r);  
end;

procedure qsorts(beg,ed:longint);
var l,r,mid,temp:longint;
begin
  l:=beg;
  r:=ed;
  mid:=map[(l+r) div 2];
  while (l<r) do 
  begin
    while (map[l]<mid) do
	  inc(l);
	while (map[r]>mid) do
	  dec(r);
	if l<=r then
	begin
	  temp:=map[l];
	  map[l]:=map[r];
	  map[r]:=temp;
	 
	  inc(l);
	  dec(r);
	end;
  end;
  if l<ed then qsorts(l,ed);
  if r>beg then qsorts(beg,r);  
end;

procedure init;
var i,j,now,thenn:longint;
begin
  readln (m,s,c);
  for i:=1 to c do 
    readln (map[i]);
  qsorts(1,c);
  j:=map[1];
  now:=j;
  for i:=1 to (c-1) do begin
    thenn:=map[i+1];
	queue[i]:=thenn-now;
	now:=thenn;
  end;	
  total:=thenn-j+1;
end;
	
procedure main;
var i:longint;
begin 
  init;
  qsort(1,c-1);
  if m>c then 
  begin
    writeln (c);
  end
  else
  begin
    for i:=1 to (m-1) do
      dec(total,queue[c-i]);
    writeln (total+m-1);	
  end;
end;

begin
  assign (input,'barn1.in');
  assign (output,'barn1.out');
  reset (input);
  rewrite (output);
  
  main;
  
  close (input);
  close (output);
  
end.