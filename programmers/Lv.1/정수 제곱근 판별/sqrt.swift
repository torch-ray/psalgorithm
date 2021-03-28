func solution(_ n:Int64) -> Int64 {
    if n == 1 {return 4}
    var number = Double(n) / 2
    var sqrt: Int64 = -1
    var i: Double = 1
    
    while number > 0 {
        number -= i
        i+=1
        if number - i < 0 { break }
    }
    
    if number * 2 == i {
        let tmp = number * 2
        sqrt = Int64((tmp+1) * (tmp+1))
    }
    return sqrt
}
