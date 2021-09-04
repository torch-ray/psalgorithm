let n = Int(readLine()!)!
var stack:[Int] = [], num = 0, res = ""

for _ in 1...n {
    let now = Int(readLine()!)!
    
    while num < now {
        num+=1
        stack.append(num)
        res+="+\n"
    }
    
    if stack.removeLast() != now {
        res = "NO"
        break
    }
    res += "-\n"
}
print(res)
