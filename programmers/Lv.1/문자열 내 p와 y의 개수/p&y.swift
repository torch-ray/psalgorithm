import Foundation

func solution(_ s:String) -> Bool
{
    var cnt = 0
    for i in s.lowercased() {
        if i == "p" { cnt += 1}
        else if i == "y" {cnt -= 1}
    }
    return cnt==0 ? true:false
}
