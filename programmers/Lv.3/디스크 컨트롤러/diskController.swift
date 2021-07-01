func solution(_ jobs:[[Int]]) -> Int {
    var disk = jobs.sorted { $0[1] < $1[1] }
    var (res, time) = (0, 0)

    while !disk.isEmpty {

        for idx in 0..<disk.count {
            if disk[idx][0] <= time {
                time += disk[idx][1]
                res += time - disk[idx][0]
                disk.remove(at: idx)
                break
            }

            if disk.count-1 == idx {
                time += 1
            }
        }

    }
    return res / jobs.count
}
