for _ in range(int(input())):
    res=""
    n,s=input().split()
    for c in s:
        res+=c*int(n)
    print(res)