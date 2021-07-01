func checkt(_ time:Double, _ table:[[Double]]) -> Int {
    var cnt = 0
    let start = time
    let end = time+1000

    for timeInfo in table {
        if timeInfo[0] < end && timeInfo[1] >= start {
            cnt+=1
        }
    }
    return cnt
}

func parseToSecond(_ time:Substring) -> Double {
    let time = time.split{$0==":"}
    let t = Double(time[0])! * 3600
    let m = Double(time[1])! * 60
    let s = Double(time[2])!
    return (t+m+s)
}

func solution(_ lines:[String]) -> Int {
    let logs = lines.map{$0.split{$0==" "}}
    var timeTable:[[Double]] = []
    var res = 1

    for log in logs {
        var timeLog = log
        let end = parseToSecond(timeLog[1]) * 1000
        timeLog[2].removeLast()
        let start = end - (Double(timeLog[2])! * 1000) + 1
        timeTable.append([start, end])
    }

    for time in timeTable {
        res = max(res, checkt(time[0], timeTable), checkt(time[1], timeTable))
    }

    return res
}
