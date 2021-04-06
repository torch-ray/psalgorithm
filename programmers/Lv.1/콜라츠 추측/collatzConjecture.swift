func solution(_ num:Int) -> Int {
    
    var number = num
    var cnt = 0
    
    while number > 1 {
        if number % 2 == 0 {
            number /= 2
        } else {
            number = number * 3 + 1
        }
        cnt+=1
        if cnt >= 500 { break }
    }
    
    return number == 1 ? cnt:-1
}
