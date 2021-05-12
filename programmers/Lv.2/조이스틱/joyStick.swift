import Foundation

func upDown(_ element: Character) -> Int {
    let up = 65
    let down = 91
    let element = Int(element.asciiValue!)
    return min(element-up, down-element)
}


func solution(_ name:String) -> Int {
    var res = 0

    for i in name {
        res += upDown(i)
    }

    let name = name.map{String($0)}
    var cnt = name.count-1
    for i in 0..<name.count {
        if name[i] != "A" {
            var nextIndex = i+1

            while nextIndex < name.count && name[nextIndex] == "A" {
                nextIndex += 1
            }

            let move = i*2 + name.count - nextIndex
            cnt = min(move, cnt)
        }
    }
    return res + cnt
}
