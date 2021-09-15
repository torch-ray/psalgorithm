func solution(_ sticker:[Int]) -> Int{
    guard sticker.count > 1 else {
        return sticker.first!
    }
    
    var dp1 = [Int](repeating: 0, count: sticker.count), dp2 = dp1
    dp1[0] = sticker[0]
    dp1[1] = dp1[0]
    dp2[0] = 0
    dp2[1] = sticker[1]
    
    for i in 2..<sticker.count {
        dp1[i] = max(dp1[i-1], dp1[i-2]+sticker[i])
        dp2[i] = max(dp2[i-1], dp2[i-2]+sticker[i])
    }
    
    dp1[sticker.count-1] -= sticker.last!
    
    return max(dp1.max()!, dp2.max()!)
}
