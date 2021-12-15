a=b=0
for i in range(9):
    n=int(input())
    if a<n:
        a=n
        b=i+1
print(a, b, sep='\n')