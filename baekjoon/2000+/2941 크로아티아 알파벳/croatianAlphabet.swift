import Foundation

var a = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
var n = readLine()!

for s in a {
    n=n.replacingOccurrences(of: s, with: ".")
}
print(n.count)
