func solution(_ a:Int, _ b:Int) -> String {
    let day = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    return day[(days[0..<a-1].reduce(0,+)+b)%7]
}
