let N = Int(readLine()!)!
let A = readLine()!.split{$0==" "}.map{Int(String($0))!}
let M = Int(readLine()!)!
let B = readLine()!.split{$0==" "}.map{Int(String($0))!}

var dict:[Int:Int] = [:]

for num in A {
    dict[num] = (dict[num] ?? 0) + 1
}

var res = ""

for num in B {
    res += dict[num] == nil ? "0 " : "\(dict[num]!) "
}
print(res)
