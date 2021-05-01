import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var bridge = [Int](repeating: 0, count: bridge_length)
    var trucks = truck_weights
    var time = 0
    var nWeight = 0
    
    while !bridge.isEmpty {
        time+=1
        nWeight-=bridge.remove(at: 0)
        if !trucks.isEmpty {
            if nWeight + trucks.first! <= weight {
                let tmp = trucks.remove(at: 0)
                bridge.append(tmp)
                nWeight+=tmp
            } else {
                bridge.append(0)
            }
        }
    }
    return time
}
