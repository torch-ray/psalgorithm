import Foundation
func pow(_ e: Int) -> Int {
    var ans = 1
    for _ in 0..<e {
        ans = ans * 3
    }
    return ans
}

func solution(_ n:Int) -> Int {
    var decimal = n
    var ternary = [Int]()
    while decimal>0 {
        ternary.append(decimal%3)
        decimal = decimal/3
    }
    var res = 0
    for i in 1...ternary.count {
        res += ternary[i-1] * pow(ternary.count-i)
    }
    return res
}
