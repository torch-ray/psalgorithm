for _ in range(int(input())):
    a=list(map(int, input().split()))
    avg=sum(a[1:])/a[0]
    cnt=list(filter(lambda x: x>avg, a[1:]))
    res=len(cnt)/a[0]*100
    print(f'{res:.3f}%')