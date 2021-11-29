n,x=map(int, input().split())
res=""
for a in input().split():
    if int(a)<x:
        res+=a+" "
print(res)