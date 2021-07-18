func solution(_ n:Int, _ build_frame:[[Int]]) -> [[Int]] {
    var map:[[Int]] = []
    
    for frame in build_frame {
        let (x, y, a, b) = (frame[0], frame[1], frame[2], frame[3])
        
        if b == 1 && x <= (a == 0 ? n:n-1) &&
            y <= (a == 0 ? n-1:n) && ((a == 0) ? isBuildableForPillar(frame, map):isBuildableForBeam(frame, map)) {
            map.append([x, y, a])
        }
        
        if b == 0 && map.contains([x, y, a]) && isRemovable(frame, map) {
            map = map.filter { $0 != [x, y, a] }
        }
    }
    
    return map.sorted { $0[0] != $1[0] ? $0[0] < $1[0] : $0[1] != $1[1] ? $0[1]<$1[1] : $0[2]<$1[2]
    }
}

func isBuildableForPillar(_ frame:[Int], _ map:[[Int]]) -> Bool {
    let point:(x: Int, y: Int) = (frame[0], frame[1])
    if point.y == 0 { return true }
    return map.contains([point.x, point.y-1, 0]) || (map.contains([point.x-1,point.y,1]) || map.contains([point.x,point.y,1]))
}

func isBuildableForBeam(_ frame:[Int], _ map:[[Int]]) -> Bool {
    let point:(x: Int, y: Int) = (frame[0], frame[1])
    guard point.y > 0 else { return false }
    return (map.contains([point.x, point.y-1, 0]) || map.contains([point.x+1, point.y-1, 0])) || (map.contains([point.x-1, point.y, 1]) && map.contains([point.x+1, point.y, 1]))
}

func isRemovable(_ frame:[Int], _ map:[[Int]]) -> Bool {
    let point:(x: Int, y: Int) = (frame[0], frame[1])
    let newMap  = map.filter { $0 != frame.dropLast() }
    return newMap.filter{
            if (frame[2] == 0) {
                return ($0 == [point.x, point.y+1, 0]
                            || $0 == [point.x, point.y+1, 1]
                            || $0 == [point.x-1, point.y+1, 1])
            }
            return ($0 == [point.x-1, point.y, 1]
                        || $0 == [point.x+1, point.y, 1]
                        || $0 == [point.x+1, point.y, 0]
                        || $0 == [point.x, point.y, 0])
        }
        .map { $0[2] == 0  ? isBuildableForPillar($0, newMap) : isBuildableForBeam($0, newMap) }
        .reduce(true) { $0 && $1 }
}
