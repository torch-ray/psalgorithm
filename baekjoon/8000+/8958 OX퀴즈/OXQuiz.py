for _ in range(int(input())):
    a=b=0
    for c in input():
        if c == "O":
            a+=b+1
            b+=1
        else:
            b=0
    print(a)