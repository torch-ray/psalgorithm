func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var dict:[String:[(String, Int)]] = [:]
    
    for job in table {
        let info = job.split{$0==" "}.map{String($0)}
        
        for i in 1...5 {
            if dict[info[i]] == nil { dict[info[i]] = [(info[0], 6-i)] }
            else { dict[info[i]]!.append((info[0], 6-i)) }
        }
    }
    
    var list:[String:Int] = [:], maxNum = 0
    
    for i in 0..<languages.count {
        for point in dict[languages[i]]! {
            list[point.0] = (list[point.0] ?? 0) + point.1 * preference[i]
            maxNum = max(maxNum, list[point.0]!)
        }
    }
    
    var res = ""
    
    for key in list.keys.sorted() {
        if list[key] == maxNum {
            res = key
            break
        }
    }
    
    
    return res
}
