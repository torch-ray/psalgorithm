a=int(input())
b=int(input())
c=int(input())
res=[0]*10

for num in str(a*b*c):
    res[int(num)]+=1

for num in res:
    print(num)