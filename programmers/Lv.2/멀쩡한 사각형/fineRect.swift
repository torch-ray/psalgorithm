func gcd(_ a: Int, _ b:Int) -> Int {
    return b==0 ? a : gcd(b, a%b)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    return Int64((w*h) - (w+h-gcd(w, h)))
}
