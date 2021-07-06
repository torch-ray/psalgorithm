func solution(_ tickets:[[String]]) -> [String] {
    
    var ticketList:[String:[String]] = [:]
    
    for ticket in tickets {
        let (start, end) = (ticket.first!, ticket.last!)
        if ticketList[start] == nil { ticketList[start] = [end] }
        else { ticketList[start]?.append(end) }
    }
    
    for key in ticketList.keys {
        ticketList[key]?.sort()
    }

    func dfs() -> [String] {
        var stack = ["ICN"]
        var res:[String] = []
        
        while !stack.isEmpty {
            let top = stack.last!
            
            if !ticketList.contains(where: {$0.key.contains(top)}) || ticketList[top]?.count == 0 {
                res.append(stack.removeLast())
            } else {
                stack.append(ticketList[top]!.removeFirst())
            }
        }
        return res
    }
    return dfs().reversed()
}
