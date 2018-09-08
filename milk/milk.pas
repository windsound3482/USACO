{
  AUTHOR:wind1740
  LANG:PASCAL
  PROG:milk
}
var sum,n:longint;
    cost,amount:array [1..10000] of longint;
    

procedure qsort(beg,ed:longint);
var l,r,mid,temp:longint;
begin
  l:=beg;
  r:=ed;
  mid:=cost[(l+r) div 2];
  while (l<r) do 
  begin
    while (cost[l]<mid) do
	  inc(l);
	while (cost[r]>mid) do
	  dec(r);
	if l<=r then
	begin
	  temp:=cost[l];
	  cost[l]:=cost[r];
	  cost[r]:=temp;
	  temp:=amount[l];
	  amount[l]:=amount[r];
	  amount[r]:=temp;
	  inc(l);
	  dec(r);
	end;
  end;
  if l<ed then qsort(l,ed);
  if r>beg then qsort(beg,r);  
end;

procedure main;
var i,k,now,summ:longint;
begin
  readln (sum,n);
  for i:=1 to n do
    readln (cost[i],amount[i]); 
  qsort(1,n);
  k:=sum;
  now:=0;
  summ:=0;
  while k>0 do 
  begin
    inc(now);
    if amount[now]<k then 
	begin
	  inc(summ,cost[now]*amount[now]);
	  k:=k-amount[now];
	end
	else
	begin
	  inc(summ,cost[now]*k);
	  k:=0;
	end;
  end;
  writeln (summ);
end;


begin
  assign (input,'milk.in');
  assign (output,'milk.out');
  reset (input);
  rewrite (output);
  
  main;
  
  close (input);
  close (output);
end.