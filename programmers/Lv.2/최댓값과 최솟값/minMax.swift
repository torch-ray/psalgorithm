func solution(_ s:String) -> String {
    let numArr = s.split{$0==" "}.map{Int(String($0))!}
    return "\(numArr.min()!) \(numArr.max()!)"
}
