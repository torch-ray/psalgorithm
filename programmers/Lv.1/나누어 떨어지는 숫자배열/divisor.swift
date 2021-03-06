func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var res = [Int]()
    for element in arr.sorted() {
        if element % divisor == 0 {
            res.append(element)
        }
    }
    return !res.isEmpty ? res:[-1]
}
