func check(_ num:String) -> Int {
    
    var cnt = 0
    for char in num {
        if char == "1" {
            cnt+=1
        }
    }
    return cnt
}

func solution(_ n:Int) -> Int{
    
    let cnt = check(String(n, radix: 2))
    
    for num in (n+1)...1000000 {
        let binary = String(num, radix: 2)
        if cnt == check(binary) {
            return num
        }
    }
    
    return 0
}
