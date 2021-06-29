func gcd(_ a:Int, _ b:Int) -> Int {
    let mod = a%b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}

func lcm(_ a:Int, _ b:Int, _ gcd:Int) -> Int {
    return a*b/gcd
}

func solution(_ arr:[Int]) -> Int {
    var arr = arr

    for idx in 1..<arr.count {
        let greatcd = gcd(arr[idx-1], arr[idx])
        arr[idx] = lcm(arr[idx-1], arr[idx], greatcd)
    }

    return arr.last!
}
