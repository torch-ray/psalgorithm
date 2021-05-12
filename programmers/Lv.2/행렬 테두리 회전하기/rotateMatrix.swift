import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: columns), count: rows)
    var res = [Int]()
    
    for i in 0..<rows {
        for j in 0..<columns {
            map[i][j] = (i*columns)+j+1
        }
    }
    
    for arr in queries {
        let (x1, y1) = (arr[0]-1, arr[1]-1)
        let (x2, y2) = (arr[2]-1, arr[3]-1)
        let copyMap = map
        var minNum = 9999999
        
        for i in y1..<y2 {
            map[x1][i+1] = copyMap[x1][i]
            minNum = min(map[x1][i+1], minNum)
        }
        
        for i in x1..<x2 {
            map[i+1][y2] = copyMap[i][y2]
            minNum = min(map[i+1][y2], minNum)
        }
        
        for i in stride(from: y2-1, through: y1, by: -1) {
            map[x2][i] = copyMap[x2][i+1]
            minNum = min(map[x2][i], minNum)
        }
        
        for i in stride(from: x2-1, through: x1, by: -1) {
            map[i][y1] = copyMap[i+1][y1]
            minNum = min(map[i][y1], minNum)
        }
        res.append(minNum)
    }
    return res
}

