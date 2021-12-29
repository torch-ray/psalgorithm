s=input().upper()
cnt=0
for c in set(s):
    tmp=s.count(c)
    if cnt==tmp:
        res='?'
    if cnt<tmp:
        cnt=tmp
        res=c
print(res)