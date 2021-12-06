n=int(input())
num=n
res=0

while True:
    a = num//10
    b = num%10
    num = (b*10)+(a+b)%10
    res += 1
    if n == num:
        break
print(res)
