func checkRank(_ num:Int) -> Int {
    switch num {
    case 6: return 1
    case 5: return 2
    case 4: return 3
    case 3: return 4
    case 2: return 5
    default: return 6
    }
}

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let joker = lottos.filter{$0==0}.count
    let match = lottos.filter{win_nums.contains($0)}.count
    return [checkRank(joker+match), checkRank(match)]
}
