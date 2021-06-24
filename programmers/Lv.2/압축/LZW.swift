func initializeDictionary() -> [String:Int] {
    var dict:[String:Int] = [:]
    for num in 65...90 {
        let key = String(UnicodeScalar(num)!)
        dict[key] = num-64
    }
    return dict
}

func solution(_ msg:String) -> [Int] {
    var dictionary = initializeDictionary()
    var res:[Int] = []
    let msg = msg.map{String($0)}

    var key = msg.first!

    for idx in 1..<msg.count {
        let newKey = key+msg[idx]
        if dictionary[newKey] == nil {
            dictionary[newKey] = dictionary.keys.count+1
            res.append(dictionary[key]!)
            key = msg[idx]
        } else {
            key+=msg[idx]
        }
    }
    res.append(dictionary[key]!)
    return res
}
