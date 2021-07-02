func solution(_ operations:[String]) -> [Int] {
    var heap:[Int] = []
    let operations = operations.map{$0.split{$0==" "}}

    for operation in operations {
        if operation.first! == "I" {
            heap.append(Int(operation.last!)!)
            heap.sort()
        } else {
            if heap.isEmpty { continue }
            if operation.last! == "1" {
                heap.removeLast()
            } else {
                heap.removeFirst()
            }
        }
    }
    return heap.isEmpty ? [0,0]:[heap.last!, heap.first!]
}
