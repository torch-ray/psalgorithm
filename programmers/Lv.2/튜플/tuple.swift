import Foundation

func solution(_ s:String) -> [Int] {
    let strArr = s.components(separatedBy: ["{", "}"])
        .filter{$0 != "" && $0 != ","}
        .sorted{$0.count<$1.count}
        .map{$0.split{$0==","}}
    
    var res = [Int]()
    
    for arr in strArr {
        for element in arr {
            let intTmp = Int(String(element))!
            if !res.contains(intTmp) {
                res.append(intTmp)
            }
        }
    }
    return res
}
