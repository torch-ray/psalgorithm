func solution(_ land:[[Int]]) -> Int{
    var land = land

    for row in 1..<land.count {
        var exRow = land[row-1]
        let firstMax = exRow.max()!
        let index = exRow.firstIndex(of: firstMax)!
        exRow.remove(at: index)
        let secondMax = exRow.max()!

        for col in 0..<4 {
            index == col ? (land[row][col] += secondMax) : (land[row][col] += firstMax)
        }
    }
    return land.last!.max()!
}
