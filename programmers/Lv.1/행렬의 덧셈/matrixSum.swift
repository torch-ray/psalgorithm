func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var res = [[Int]](repeating: [], count: arr1.count)
    for arr in 0..<arr1.count {
        for idx in 0..<arr1[arr].count {
            res[arr].append(arr1[arr][idx] + arr2[arr][idx])
        }
    }
    return res
}
