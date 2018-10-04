'''
  Author:wind1740
  LANG:PYTHON3
  PROG:crypt1
'''


    
def checkk(x):

    for i in range(1,n+1): 

        if map1[i-1]==x :
            return True

    return False


def check(x,y):

    if x>=pow (10,y) :
        return False
    if x<pow (10,y-1) :
        return False
    i=x
    while i!=0 :

        if checkk(i%10)==False :
            return False
        i=int(i/10);
  
    return True


def pro(now):

    if now==6 :

        if check((10*mapp[4]+mapp[5])*(100*mapp[1]+10*mapp[2]+mapp[3]),4)==True :
            global summ    
            summ+=1

    else :

        for i in range(1,n+1): 
    
            mapp[now]=map1[i-1]
      
            if (now==4) or (now==5) :
                if check(mapp[now]*(100*mapp[1]+10*mapp[2]+mapp[3]),3)==True :
                    pro(now+1)
            else:
                pro(now+1)
    return 
inn=open("crypt1.in", "r")	
out = open("crypt1.out", "w")	
n = int(inn.readline())
map1 = list(map(int, inn.readline().split()))

mapp = [0 for n in range(100)]
summ=0   
pro(1)
out.write (str(summ)+"\n")
inn.close()
out.close()



