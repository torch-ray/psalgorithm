func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var arrCopy = [[Int]](repeating: [Int](repeating: 0, count: arr2.first!.count), count: arr1.count)

    for i in 0..<arrCopy.count {
        for j in 0..<arrCopy.first!.count {
            for k in 0..<arr2.count {
                arrCopy[i][j]+=arr1[i][k]*arr2[k][j]
            }
        }
    }
    return arrCopy
}
