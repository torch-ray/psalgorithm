func solution(_ arr:[[Int]]) -> [Int] {

    let n = arr.count
    var (zero, one) = (0, 0)

    func quadTree(_ x:Int, _ y:Int, _ n:Int) {
        let first = arr[x][y]
        var flag = false

        for i in (x..<(x+n)) {
            if flag { break }

            for j in (y..<(y+n)) {
                if arr[i][j] != first {
                    quadTree(x, y, n/2)
                    quadTree(x, y+n/2, n/2)
                    quadTree(x+n/2, y, n/2)
                    quadTree(x+n/2, y+n/2, n/2)
                    flag = true
                    break
                }
            }
        }

        if !flag {
            if arr[x][y] == 0 {
                zero+=1
            } else {
                one+=1
            }
        }
    }

    quadTree(0, 0, n)

    return [zero, one]
}
