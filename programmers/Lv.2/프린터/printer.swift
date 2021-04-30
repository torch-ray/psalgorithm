import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var idx = Array(0..<priorities.count)
    var list = priorities
    let reverse = list.sorted(by: >)
    
    var i = 0
    while list != reverse {
        if list[i] < list[(i+1)...].max()! {
            list.append(list.remove(at: i))
            idx.append(idx.remove(at: i))
        } else {
            i+=1
        }
    }
    
    return idx.firstIndex(of: location)! + 1
}
