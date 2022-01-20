var cnt = 0
for _ in 0..<Int(readLine()!)! {
    var s = ""
    for c in readLine()! {
        if !s.contains(c) {
            s+="\(c)"
        } else if s.last! != c {
            s=""
            break
        }
    }
    if s != "" { cnt+=1 }
}
print(cnt)

