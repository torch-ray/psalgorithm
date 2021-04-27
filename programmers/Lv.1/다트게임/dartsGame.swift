import Foundation
func solution(_ dartResult:String) -> Int {
    var strList = [String]()
    
    for i in dartResult {
        if  i == "0"{
            if !strList.isEmpty && strList[strList.endIndex-1] == "1" {
                strList.removeLast()
                strList.append("10")
            } else {
                strList.append("0")
            }
        } else if i.isNumber {
            strList.append(String(i))
        } else if i == "S" {
            let tmp = pow(Double(strList.removeLast())!, 1)
            strList.append(String(tmp))
        } else if i == "D" {
            let tmp = pow(Double(strList.removeLast())!, 2)
            strList.append(String(tmp))
        } else if i == "T" {
            let tmp = pow(Double(strList.removeLast())!, 3)
            strList.append(String(tmp))
        } else if i == "*" {
            if strList.count == 1 {
                strList[0] = String(Double(strList[0])! * 2)
                continue
            }
            let a = Double(strList[strList.endIndex-1])! * 2
            let b = Double(strList[strList.endIndex-2])! * 2
            strList[strList.endIndex-1] = String(a)
            strList[strList.endIndex-2] = String(b)
        } else if i == "#" {
            let tmp = "-" + strList.removeLast()
            strList.append(tmp)
        }
    }
    let res = strList.map{Int(Double($0)!)}.reduce(0, +)
    return res
}
