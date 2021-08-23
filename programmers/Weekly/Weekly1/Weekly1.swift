import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64 {
    var res = 0
    
    for num in stride(from: price, through: price*count , by: price) {
        res += num
    }
    
    
    return res > money ? Int64(res-money):0
}
