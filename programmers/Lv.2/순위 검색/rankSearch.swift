func binarySearch(_ scores:[Int], _ target:Int) -> Int {
    var (low, high) = (0, scores.count-1)
    guard scores[high] >= target else { return 0 }
    guard scores[low] < target else { return scores.count }

    while low <= high {
        var mid = (low+high)/2
        let tmp = scores[mid]

        if tmp == target {
            while mid > 0 && scores[mid-1] == tmp {
                mid -= 1
            }
            return scores.count - mid
        } else if tmp > target {
            high = mid-1
        } else {
            low = mid+1
        }
    }
    return scores.count - low
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    let info = info.map{$0.split{$0==" "}.map{[String($0), "-"]}}
    var allCases = [[String]:[Int]]()
    for i in info {
        for language in i[0] {
            for position in i[1] {
                for career in i[2] {
                    for food in i[3] {
                        allCases[[language, position, career, food]] = (allCases[[language, position, career, food]] ?? []) + [Int(i[4][0])!]
                    }
                }
            }
        }
    }

    for key in allCases.keys {
        allCases[key]?.sort(by: <)
    }

    return query.map {
        let required = $0.split{$0==" "}.filter{$0 != "and"}.map{String($0)}
        guard let applicants = allCases[Array(required[0...3])] else { return 0 }
        let minimum = Int(required[4])!
        return binarySearch(applicants, minimum)
    }
}
