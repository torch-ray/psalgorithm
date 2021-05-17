import Foundation

func operate(_ oper:Character, _ num1:Int64, _ num2:Int64) -> Int64 {
    if oper == "-" { return num1 - num2 }
    else if oper == "+" { return num1 + num2 }
    else { return num1 * num2 }
}


func operation(_ nums:[Int64], _ opers:[Character], _ prior:[Character]) -> Int64 {
    var nums = nums
    var opers = opers
    for oper in prior {
        while let index = opers.firstIndex(of: oper) {
            nums[index] = operate(oper, nums[index], nums[index+1])
            nums.remove(at: index+1)
            opers.remove(at: index)
        }
    }
    return abs(nums.first!)
}

func solution(_ expression:String) -> Int64 {
    let num = expression.split{!$0.isNumber}.map{Int64(String($0))!}
    let operators = expression.split{$0.isNumber}.map{String($0)}.map{Character($0)}
    let opers = "-*+"
    var res:Int64 = 0

    for i in opers {
        for j in opers {
            guard i != j else { continue }
            let k = opers.filter{$0 != i && $0 != j}.first!
            let result = operation(num, operators, [i, j, k])
            res = max(res, result)
        }
    }
    return res
}
