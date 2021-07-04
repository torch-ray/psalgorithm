func isBanned(_ user:String, _ banned:String) -> Bool {
    if user.count != banned.count { return false }
    for i in 0..<user.count {
        let index = user.index(user.startIndex, offsetBy: i)
        if banned[index] == "*" { continue }
        if banned[index] != user[index] {
            return false
        }
    }
    return true
}

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {

    var list:[Int:[String]] = [:]
    var res:Set<Set<String>> = Set()

    for idx in 0..<banned_id.count {
        for user in user_id {
            if isBanned(user, banned_id[idx]) {
                if list[idx] == nil { list[idx] = [user] }
                else { list[idx]?.append(user) }
            }
        }
    }

    func comb(_ banned:[[String]], _ n:Int, _ ans:[String]) {
        var ans = ans
        if n == banned.count {
            res.insert(Set(ans))
            return
        }
        for i in 0..<banned[n].count where !ans.contains(banned[n][i]) {
            let id = banned[n][i]
            ans.append(id)
            comb(banned, n+1, ans)
            ans.removeLast()
        }
    }
    comb(list.map{$0.value}, 0, [])
    return res.count
}
