var a:[[Int]]=[]
for _ in 0..<Int(readLine()!)! {
    a.append(readLine()!.split{$0==" "}.map{Int(String($0))!})
}
a.sort { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] < $1[1] }
for x in a {
    print(x[0], terminator: " ")
    print(x[1])
}
