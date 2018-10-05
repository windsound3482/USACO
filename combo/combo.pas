{
	Author:wind1740
	LANG:PASCAL
	PROG:combo
}
var n:longint;
    mapp:array [1..2,1..3] of longint;
	jetzt:array [1..3] of longint;
	flag:array [1..100,1..100,1..100] of boolean;
	sum:longint;

	
procedure con(was,wo:longint);
var i:longint;
begin
	if wo=4 then 
	begin
		if flag[jetzt[1],jetzt[2],jetzt[3]]=false then
		begin
			flag[jetzt[1],jetzt[2],jetzt[3]]:=true;
			inc(sum);
		end;
	end
	else
	begin
		for i:=(-2) to (2) do 
		
			
		begin
			jetzt[wo]:=i+mapp[was,wo];
			while jetzt[wo]>n do 
			begin
				dec(jetzt[wo],n);
			end;
			while jetzt[wo]<=0 do
				inc(jetzt[wo],n);
			con(was,wo+1);
		end;
		
	end;
end;
	
procedure main;
var i,j,k:longint;
begin
	readln (n);
	for i:=1 to n do
		for j:=1 to n do
			for k:=1 to n do
				flag[i,j,k]:=false;
	for i:=1 to 2 do 
		for j:=1 to 3 do
			read (mapp[i,j]);
	con(1,1);
	con(2,1);
	writeln (sum);
end;

begin
	assign (input,'combo.in');
	assign (output,'combo.out');
	reset (input);
	rewrite (output);
	
	main;
	
	close (input);
	close (output);
end.