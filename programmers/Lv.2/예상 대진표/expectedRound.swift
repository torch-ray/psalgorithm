func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var (a, b) = (min(a, b), max(a, b))
    var cnt = 0
    
    while b-a != 1 || a%2 == 0{
        a = a%2 == 0 ? a/2:(a+1)/2
        b = b%2 == 0 ? b/2:(b+1)/2
        cnt+=1
    }
    
    return cnt+1
}
