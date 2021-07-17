func s(_ a:Int, _ b:Int)->Int{
    if b==1{ return b }
    if a==0{ return b }
    return s(a-1, b)+s(a, b-1)
}
let t = Int(readLine()!)!
for _ in 0..<t {
    print(s(Int(readLine()!)!, Int(readLine()!)!))
}
