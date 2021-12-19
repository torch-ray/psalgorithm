n=input()
s=''
for x in list(range(97, 123)):
    s+=str(n.find(chr(x)))+' '
print(s)