import Foundation

func getGrade(_ score: Float) -> String {

    switch score {
    case 90...: return "A"
    case 80...: return "B"
    case 70...: return "C"
    case 50...: return "D"
    default: return "F"
    }

}

func solution(_ scores:[[Int]]) -> String {
    let n = scores.count
    var res = ""

    for row in 0..<n {
        var selfScore = scores[row][row], totalScore = 0, cnt = 0
        var maxScore = 0, minScore = Int.max

        for col in 0..<n {
            guard row != col else { continue }
            let score = scores[col][row]

            totalScore += score
            cnt += 1
            maxScore = max(maxScore, score)
            minScore = min(minScore, score)
        }

        if maxScore >= selfScore && minScore <= selfScore {
            cnt += 1
            totalScore += selfScore
        }

        res += getGrade(Float(totalScore)/Float(cnt))
    }

    return res
}
