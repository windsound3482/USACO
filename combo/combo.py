'''
	Author:wind1740
	LANG:PYTHON3
	PROG:combo
'''
	
def con(was,wo):
	global jetzt
	if wo==4 : 
		if flag[jetzt[1]][jetzt[2]][jetzt[3]]==False:
			flag[jetzt[1]][jetzt[2]][jetzt[3]]=True
			global sum
			sum+=1
	else :
		for i in range (-2,3):
			
			jetzt[wo]=i+mapp[was][wo-1]
			while jetzt[wo]>n :
				jetzt[wo]-=n
			while jetzt[wo]<=0 :
				jetzt[wo]+=n
			con(was,wo+1)
	
inn=open ("combo.in","r")
out=open ("combo.out","w")
n=int (inn.readline());
flag = [[[False for i in range(101)] for j in range(101)] for k in range(101)]
jetzt=[0 for i in range (5)]
mapp=[[0 for i in range (3)] for j in range (4)]
sum=0
for i in range (1,3) :
	mapp[i]=list (map(int,inn.readline().split()))
con(1,1);
con(2,1);
out.write (str(sum)+'\n');
inn.close()
out.close()
