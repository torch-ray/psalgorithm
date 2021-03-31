import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var leftLast = "*"
    var rightLast = "#"
    var pad = ["1": (0, 0), "2": (0, 1), "3": (0, 2),
               "4": (1, 0), "5": (1, 1), "6": (1, 2),
               "7": (2, 0), "8": (2, 1), "9": (2, 2),
               "*": (3, 0), "0": (3, 1), "#": (3, 2)]
    var answer = ""
    
    for number in numbers {
        if number == 1 || number == 4 || number == 7 {
            leftLast = "\(number)"
            answer += "L"
        } else if number == 3 || number == 6 || number == 9 {
            rightLast = "\(number)"
            answer += "R"
        } else {
            let idx = String(number)
            let left = abs(pad[idx]!.0 - pad[leftLast]!.0) + abs(pad[idx]!.1 - pad[leftLast]!.1)
            let right = abs(pad[idx]!.0 - pad[rightLast]!.0) + abs(pad[idx]!.1 - pad[rightLast]!.1)
            
            if left < right {
                leftLast = "\(number)"
                answer += "L"
            } else if left > right {
                rightLast = "\(number)"
                answer += "R"
            } else {
                if hand == "left" {
                    leftLast = "\(number)"
                    answer += "L"
                } else {
                    rightLast = "\(number)"
                    answer += "R"
                }
            }
        }
    }
    return answer
}
