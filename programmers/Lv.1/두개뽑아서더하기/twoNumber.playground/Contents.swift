import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var ans = Set<Int>()
    for i in 0..<numbers.count {
        for j in i+1..<numbers.count {
            ans.insert(numbers[i]+numbers[j])
        }
    }
    let res = Array(ans)
    return res.sorted()
}
