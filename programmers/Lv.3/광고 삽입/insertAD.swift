import Foundation

func makeString(_ time:Int) -> String {
    let hour = time/3600
    let min = (time - (hour*3600))/60
    let sec = (time - (hour*3600 + min*60))
    return String(format: "%02d", hour) + ":" + String(format: "%02d", min) + ":" + String(format: "%02d", sec)
}

func timeConverter(_ time:String) -> Int {
    let timeArr = time.split{$0==":"}.map{Int($0)!}
    let hour = timeArr.first! * 3600
    let minute = timeArr[1] * 60
    let second = timeArr.last!
    return hour + minute + second
}

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let total = timeConverter(play_time)
    let adTime = timeConverter(adv_time)
    var viewers = [Int](repeating: 0, count: total+1)

    for log in logs {
        let timeTable = log.split{$0=="-"}
        let start = timeConverter(String(timeTable.first!))
        let end = timeConverter(String(timeTable.last!))
        viewers[start] += 1
        viewers[end] -= 1
    }

    for idx in 1..<viewers.count {
        viewers[idx] += viewers[idx-1]
    }

    for idx in 1..<viewers.count {
        viewers[idx] += viewers[idx-1]
    }

    var bestTime = viewers[adTime-1]
    var res = 0

    for time in adTime..<total {
        if bestTime < viewers[time] - viewers[time-adTime] {
            bestTime = viewers[time] - viewers[time-adTime]
            res = time+1-adTime
        }
    }

    return makeString(res)
}
