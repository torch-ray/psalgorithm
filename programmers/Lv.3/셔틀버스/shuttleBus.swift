import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    
    let crews = timetable.map{ stringTime -> Int in
        let hourNmin = stringTime.split{$0==":"}
        let hour = Int(hourNmin.first!)! * 60
        let min = Int(hourNmin.last!)!
        return hour+min
    }
    
    let buses = (0..<n).map{ idx -> Int in
        return 540 + (idx * t)
    }
    
    var passengers = [[Int]](repeating: [], count: n)
    for crew in crews.sorted() {
        for order in 0..<buses.count {
            if crew <= buses[order] {
                if passengers[order].count < m {
                    passengers[order].append(crew)
                    break
                }
            }
        }
    }
    
    let res = passengers.last!.count < m ? buses.last!:passengers.last!.last!-1
    return String(format: "%02d", res/60) + ":" + String(format: "%02d", res%60)
}
