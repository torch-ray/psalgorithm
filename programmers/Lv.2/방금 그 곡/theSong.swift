import Foundation

func makeNote(_ str:String) -> [String] {
    var replacedMusic = str
    replacedMusic = replacedMusic.replacingOccurrences(of: "C#", with: "c")
    replacedMusic = replacedMusic.replacingOccurrences(of: "D#", with: "d")
    replacedMusic = replacedMusic.replacingOccurrences(of: "F#", with: "f")
    replacedMusic = replacedMusic.replacingOccurrences(of: "G#", with: "g")
    replacedMusic = replacedMusic.replacingOccurrences(of: "A#", with: "a")
    return replacedMusic.map{String($0)}
}

func parseToSecond(_ time: Substring) -> Int {
    let parsed = time.split(separator: ":").map{Int(String($0))!}
    return parsed[0] * 60 + parsed[1]
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var res = [(Int, String)]()
    let m = makeNote(m).joined()
    for info in musicinfos{
        let infoArr = info.split{$0==","}
        let playTime = parseToSecond(infoArr[1]) - parseToSecond(infoArr[0])
        let title = String(infoArr[2])
        let note = makeNote(String(infoArr[3]))
        var play = ""
        for idx in 0..<(playTime) {
            play+=note[idx%note.count]
        }
        if play.contains(m) {
            res.append((playTime, title))
        }
    }
    res.sort{ $0.0 > $1.0 }
    return res.isEmpty ? "(None)":res.first!.1
}
