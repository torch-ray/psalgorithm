n=int(input())
c=0

while n >= 0:
    if n%5==0:
        c+=n//5
        print(c)
        break
    n-=3
    c+=1
else:
    print(-1)
