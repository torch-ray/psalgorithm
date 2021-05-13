func solution(_ numbers:[Int]) -> String {
    let number = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    return number.first!==0 ? "0":number.map{String($0)}.joined()
}
