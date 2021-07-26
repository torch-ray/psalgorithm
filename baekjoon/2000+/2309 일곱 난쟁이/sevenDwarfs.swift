import Foundation
var a:[Int] = []
for _ in 0..<9 {
    a.append(Int(readLine()!)!)
}
a.sort()
let total = a.reduce(0, +)

for i in 0..<9 {
    for j in (i+1)..<9 {
        if (total-a[i]-a[j]) == 100 {
            for k in 0..<9 {
                if k != i && k != j {
                    print(a[k])
                }
            }
            exit(0)
        }
    }
}
