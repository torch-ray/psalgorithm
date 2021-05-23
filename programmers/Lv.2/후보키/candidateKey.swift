func isUnique(_ comb:[Int], _ keys:Set<[Int]>) -> Bool {
    for key in keys {
        var unique = false
        for i in key {
            if !comb.contains(i) {
                unique = true
                break
            }
        }
        if !unique {
            return false
        }
    }
    return true
}

func rowSet(_ column:[Int], _ relation:[[String]]) -> Int {
    var rows = [String](repeating: "", count: relation.count)
    for col in column {
        for (idx, row) in relation.enumerated() {
            rows[idx] += row[col]
        }
    }
    return Set(rows).count
}

func solution(_ relation: [[String]]) -> Int {
    var keys = Set<[Int]>()
    let (columnCnt, rowCnt) = (relation.first!.count, relation.count)
    var combList = [[Int]]()

    func combination(_ relation:[[String]], _ willSelect:Int, _ current:Int, _ selected:[Int]) {
        if willSelect == 0 { combList.append(selected) }
        else if current == relation.first!.count { return }
        else {
            var newSelected = selected
            newSelected.append(current)
            combination(relation, willSelect, current+1, selected)
            combination(relation, willSelect-1, current+1, newSelected)
        }
    }

    for cnt in 1...columnCnt {
        combination(relation, cnt, 0, [])
    }
    for comb in combList {
        guard isUnique(comb, keys) else { continue }
        if rowSet(comb, relation) == rowCnt {
            keys.insert(comb)
        }
    }
    return keys.count
}
