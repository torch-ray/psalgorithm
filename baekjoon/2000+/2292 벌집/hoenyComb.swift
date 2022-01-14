let n = Int(readLine()!)!
var r = 1
var cnt = 1

while n > r {
    r+=(6*cnt)
    cnt+=1
}
print(cnt)
