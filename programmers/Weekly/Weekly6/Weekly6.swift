func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    var list: [(Double, Int, Int, Int)] = []

    for (idx1, records) in head2head.enumerated() {
        var win = 0, heavy = 0, contest = 0
        for (idx2, record) in records.enumerated() {
            if record == "W" {
                win += 1
                if weights[idx1] < weights[idx2] {
                    heavy += 1
                }
            }

            if record == "N" { continue }
            contest += 1
        }
        let winRate = contest == 0 ? 0:Double(win)/Double(contest)
        list.append((winRate, heavy, weights[idx1], idx1+1))
    }

    var res:[Int] = []
    for result in list.sorted(by: { $0.0 != $1.0 ? $0.0 > $1.0 : $0.1 != $1.1 ? $0.1 > $1.1 : $0.2 != $1.2 ? $0.2 > $1.2 : $0.3 < $1.3 }) {
        res.append(result.3)
    }

    return res
}
