public func solution(_ N : Int) -> Int {
    var peri = 0
    let mathSqrt = sqrt(Double(N))

    for i in 1..<Int(mathSqrt)+1 {
        if i * i == N {
            peri = i
            break
        }

        if N % i == 0 {
            peri = i
        }
    }

    return 2 * (N/peri + peri)
}
