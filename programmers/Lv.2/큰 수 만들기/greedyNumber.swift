func solution(_ number:String, _ k:Int) -> String {
    var res:[Int] = []
    var k = k
    let numbers = number.map{Int(String($0))!}
    for (idx, val) in numbers.enumerated() {

        while k > 0, !res.isEmpty, res.last! < val {
            k -= 1
            res.removeLast()
        }

        if k == 0 {
            res.append(contentsOf: numbers[idx...])
            break
        } else {
            res.append(val)
        }
    }
    return res[..<(res.count-k)].map{String($0)}.joined()
}
