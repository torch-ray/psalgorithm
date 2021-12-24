n=int(input())

if n < 100:
    print(n)
else:
    res=99
    for i in range(100, n+1):
        tmp=list(str(i))
        if int(tmp[2])-int(tmp[1]) == int(tmp[1])-int(tmp[0]):
            res+=1
    print(res)