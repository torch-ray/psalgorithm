public func solution(_ N : Int) -> Int {
    var factors = 0
    let mathSqrt = sqrt(Double(N))
    
    for i in 1..<Int(mathSqrt)+1 {
        if i * i == N {
            factors += 1
            break
        }

        if N % i == 0 {
            factors += 2
        }
    }

    return factors
}
