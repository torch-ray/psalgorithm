a,b=map(int, input().split())
a = a if b>=45 else 23 if a==0 else a-1
b = b-45 if b>=45 else 60-(45-b)
print(a, b)