import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let supo1 = [1, 2, 3, 4, 5]
    let supo2 =  [2, 1, 2, 3, 2, 4, 2, 5]
    let supo3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var cnt = [0, 0, 0]
    var res = [Int]()

    for i in 0..<answers.count {
        if answers[i] == supo1[i%supo1.count] {cnt[0]+=1}
        if answers[i] == supo2[i%supo2.count] {cnt[1]+=1}
        if answers[i] == supo3[i%supo3.count] {cnt[2]+=1}
    }
    
    let maxNum = cnt.max()!
    for i in 0..<cnt.count {
        if maxNum==cnt[i] {res.append(i+1)}
    }
    return res
}
