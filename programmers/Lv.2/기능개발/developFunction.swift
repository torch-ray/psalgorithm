import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var day = 0
    var progress = progresses
    var res = [Int]()
    var speed = speeds
    while !progress.isEmpty {
        day+=1
        var tmp = [Int]()
        while !progress.isEmpty {
            if progress[0] + speed[0] * day >= 100 {
                tmp.append(progress.remove(at:0))
                speed.remove(at:0)
            } else {
                break
            }
        }
        if !tmp.isEmpty {res.append(tmp.count)}
    }
    return res
}
