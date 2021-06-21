func solution(_ dirs:String) -> Int {
    var start = [0, 0]
    var visited = [[Int]]()

    for dir in dirs {
        var (x, y) = (0, 0)
        switch dir {
        case "U": (x, y) = (-1, 0)
        case "D": (x, y) = (1, 0)
        case "L": (x, y) = (0, -1)
        case "R": (x, y) = (0, 1)
        default: break
        }

        let next = [start[0]+x, start[1]+y]
        if !(-5...5).contains(next[0]) || !(-5...5).contains(next[1]) {
            continue
        }

        if !visited.contains(start+next) && !visited.contains(next+start) {
            visited.append(start+next)
        }

        start = next
    }
    return visited.count
}
