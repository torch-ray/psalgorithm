func twoPairs(_ str: String) -> [[String]] {
    var pairs = [[String]]()
    let target = str.map{String($0)}

    for i in 0..<target.count-1 {
        if Character(target[i]).isLetter && Character(target[i+1]).isLetter {
            pairs.append(target[i...(i+1)].map{String($0)})
        }
    }
    return pairs
}

func solution(_ str1:String, _ str2:String) -> Int {
    var str1 = twoPairs(str1.lowercased())
    var str2 = twoPairs(str2.lowercased())
    var intersection = [[String]]()
    var union = [[String]]()
    print(str1, str2)
    for element in str1 {
        if str2.contains(element) {
            intersection.append(element)
            str1.remove(at: str1.firstIndex(of: element)!)
            str2.remove(at: str2.firstIndex(of: element)!)
        }
    }
    union = str1 + str2 + intersection
    if intersection.isEmpty && union.isEmpty { return 65536 }
    let jacquard = Double(intersection.count)/Double(union.count)
    return Int(jacquard*65536)
}
