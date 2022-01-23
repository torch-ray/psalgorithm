for _ in 0..<Int(readLine()!)! {
    var zero = [1, 0, 1], one = [0, 1, 1]
    let n = Int(readLine()!)!
    
    if n < 3 {
        print(zero[n], one[n])
        continue
    }
    
    for i in 3...n {
        zero.append(zero[i-2]+zero[i-1])
        one.append(one[i-2]+one[i-1])
    }
    print(zero[n], one[n])
}

