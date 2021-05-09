import Foundation

func solution(_ record:[String]) -> [String] {
    let cmd = record.map{Array($0.split{$0==" "}.map{String($0)})}
    var graph = [String:String]()

    for arr in cmd {
        if arr[0] != "Leave" { graph[arr[1]] = arr[2] }
    }

    var res = [String]()

    for arr in cmd {
        if arr[0] == "Enter" {
            res.append("\(graph[arr[1]]!)님이 들어왔습니다.")
        } else if arr[0] == "Leave" {
            res.append("\(graph[arr[1]]!)님이 나갔습니다.")
        }
    }
    return res
}
