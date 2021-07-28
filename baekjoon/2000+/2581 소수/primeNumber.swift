let (a, b) = (Int(readLine()!)!, Int(readLine()!)!)
func isPrime(_ num:Int) -> Bool {
    if num == 2 || num == 3 { return true }
    for i in 2...num/2 {
        if num % i == 0 {
            return false
        }
    }
    return true
}
var res:[Int] = []
for i in a...b where i > 1 {
    if isPrime(i) {
        res.append(i)
    }
}

if res.reduce(0, +) != 0 {
    print(res.reduce(0, +))
}
print(res.first ?? -1)
