func check(_ arr:[String]) -> Int? {
    switch arr.joined() {
    case "zero": return 0
    case "one": return 1
    case "two": return 2
    case "three": return 3
    case "four": return 4
    case "five": return 5
    case "six": return 6
    case "seven": return 7
    case "eight": return 8
    case "nine": return 9
    default:
        return nil
    }
}

func solution(_ s:String) -> Int {
    let input = s.map{$0}
    var res = ""
    var list:[String] = []
    for char in input {
        if char.isNumber {
            res += "\(char)"
        } else {
            list.append("\(char)")
            let number = check(list)
            if number != nil {
                res += "\(number!)"
                list.removeAll()
            }
        }
    }

    return Int(res)!
}
