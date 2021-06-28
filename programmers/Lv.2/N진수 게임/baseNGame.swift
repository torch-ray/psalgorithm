func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    var numbers = ""
    var res = ""

    for num in 0..<(m * t) {
        let number = String(num, radix: n)
        numbers += number
    }

    let numArr = numbers.map { String($0) }
    
    for idx in stride(from: p-1, to: (t*m), by: m) {
        res+=numArr[idx].uppercased()
    }
    return res
}
