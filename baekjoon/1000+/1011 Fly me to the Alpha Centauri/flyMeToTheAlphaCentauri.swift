for _ in 0..<Int(readLine()!)! {
    let n = readLine()!.split{$0==" "}.map{Int(String($0))!}
    var dis = n[1] - n[0], cnt = 0, move = 1, moveD = 0
    
    while moveD < dis {
        cnt += 1
        moveD += move
        if cnt % 2 == 0 {
            move += 1
        }
    }
    
    print(cnt)
}
