a=set(range(1, 10001))
b=set()

for num in a:
    for c in str(num):
        num+=int(c)
    b.add(num)

for num in sorted(a-b):
    print(num)