func binaryMap(_ number: Int, _ length: Int) -> [Int] {
    var binary = [Int]()
    var num = number
    
    while num > 0 {
        binary.append(num%2)
        num/=2
    }
    while binary.count < length {
        binary.append(0)
    }
    return binary.reversed()
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer = [String](repeating: "", count: n)
    var map1 = [[Int]]()
    var map2 = [[Int]]()
    
    for element in arr1 {
        map1.append(binaryMap(element, n))
    }
    for element in arr2 {
        map2.append(binaryMap(element, n))
    }
    
    for idx in 0..<n {
        for map in zip(map1[idx], map2[idx]) {
            if map.0 == 0 && map.1 == 0 {
                answer[idx]+=" "
            } else {
                answer[idx]+="#"
            }
        }
    }
    return answer
}
