for _ in 0..<Int(readLine()!)! {
    var v = 0
    for c in readLine()! {
        if c == "(" {
            v+=1
        } else {
            v-=1
            if v<0 { break }
        }
    }
    print(v==0 ? "YES":"NO")
}
