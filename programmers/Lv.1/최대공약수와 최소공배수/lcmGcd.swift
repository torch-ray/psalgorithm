func GCD(_ a: Int, _ b: Int) -> Int {
   return b==0 ? a:GCD(b, a%b)
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    let gcd = GCD(n, m)
    return [gcd, (n*m)/gcd]
}
