func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    
    var network:[String:(String?, Int)] = [:]
    network["-"] = (nil, 0)
    
    for i in 0..<enroll.count {
        network[enroll[i]] = (referral[i], 0)
    }

    func dfs(_ seller:String, _ money:Int) {
        guard let next = network[seller]?.0 else { return }
        let ten = money/10
        network[next]?.1 += (money - ten)
        if ten == 0 { return }
        dfs(next, ten)
    }


    for idx in 0..<seller.count {
        let money = amount[idx] * 100
        let ten = money/10
        network[seller[idx]]!.1 += (money - ten)
        dfs(seller[idx], ten)
    }

    return enroll.map{network[$0]!.1}
}
