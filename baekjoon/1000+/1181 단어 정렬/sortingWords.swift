var d:[String:Int] = [:]
for _ in 0..<Int(readLine()!)! {
    let n = readLine()!
    if d[n] == nil {
        d[n] = n.count
    }
}
for (key, _) in d.sorted(by: { $0.value != $1.value ? $0.value < $1.value : $0.key < $1.key }) {
    print(key)
}
