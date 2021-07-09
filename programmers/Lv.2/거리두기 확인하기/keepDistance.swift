func isManhattanDistance(_ places:[[String]]) -> Bool {
    let dx = [ 1, 2, 0, 0, 1, -1]
    let dy = [0, 0, 1, 2, 1, 1]

    for row in 0..<5 {
        for col in 0..<5 {
            if places[row][col] == "P" {
                for i in 0..<6 {
                    let (nx, ny) = (row+dx[i], col+dy[i])

                    if (0..<5).contains(nx) && (0..<5).contains(ny) && places[nx][ny] == "P" {

                        if row == nx {
                            if ny - col == 0 {
                                return false
                            } else {
                                if places[row][col+1] != "X" {
                                    return false
                                }
                            }

                        } else if col == ny {
                            if nx - row == 0 {
                                return false
                            } else {
                                if places[row+1][col] != "X" {
                                    return false
                                }
                            }
                        } else {
                            if row > nx {
                                if places[row-1][col] != "X" || places[row][col+1] != "X"{
                                    return false
                                }
                            } else {
                                if places[row+1][col] != "X" || places[row][col+1] != "X"{
                                    return false
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return true
}

func solution(_ places:[[String]]) -> [Int] {

    let places = places.map {$0.map{$0.map{String($0)}}}
    var res:[Int] = []

    for place in places {
        res.append(isManhattanDistance(place) ? 1:0)
    }

    return res
}
