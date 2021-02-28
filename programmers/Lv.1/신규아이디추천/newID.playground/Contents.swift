import Foundation

func isAlpha(char:Character) -> Bool {
    switch char {
    case "a"..."z":
        return true
    default:
        return false
    }
}
func solution(_ new_id:String) -> String {
    var str = Array(new_id.lowercased())
    for i in str {
        if isAlpha(char: i) || i.isNumber || i == "." || i == "-" || i == "_" {continue}
        else {str.remove(at: str.firstIndex(of: i)!)}
    }
    
    var tmp = [String]()
    for i in str {
        if tmp.isEmpty {tmp.append(String(i))}
        else if tmp[tmp.endIndex-1] == "." && tmp[tmp.endIndex-1] == String(i) {continue}
        else {tmp.append(String(i))}
    }
    
    if tmp[0] == "." {
        tmp.removeFirst()
    }
    if !tmp.isEmpty && tmp[tmp.endIndex-1] == "." {
        tmp.popLast()
    }
    
    if tmp.isEmpty {
        tmp.append("a")
    }
    
    while tmp.count > 15 {
        tmp.removeLast()
    }
    if tmp[tmp.endIndex-1] == "." {
        tmp.popLast()
    }
    
    while tmp.count < 3 {
        tmp.append(tmp[tmp.endIndex-1])
    }
    
    let res = tmp.joined()
    return res
}
