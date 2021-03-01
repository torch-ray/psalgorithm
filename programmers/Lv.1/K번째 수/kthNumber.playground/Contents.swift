import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var res = [Int]()
    
    for i in commands {
        let arr = array[i[0]-1...i[1]-1].sorted()
        res.append(arr[i[2]-1])
    }
    return res
}
