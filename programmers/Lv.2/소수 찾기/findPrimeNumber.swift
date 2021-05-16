import Foundation

func isPrime(_ num:Int) -> Bool {
    if num < 2 { return false }
    for i in 2..<num {
        if num%i == 0 { return false }
    }
    return true
}

func permutation(_ arr: [String]) -> Set<String> {
    if arr.count == 0 { return [] }

    let answerArray = (0..<arr.count).flatMap { i -> [String] in
        var removed = arr
        let element = removed.remove(at: i)
        return [element] + permutation(removed).map { element + $0}
    }
    return Set(answerArray)
}

func solution(_ numbers:String) -> Int {
    let res = Set(permutation(numbers.map{String($0)}).map{Int($0)!}).flatMap { i -> [Bool] in
        return [isPrime(i)].filter{$0==true}
    }
    return res.count
}
