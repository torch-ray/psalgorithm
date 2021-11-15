let N = readLine()!.split{$0==" "}.map{Int(String($0))!}
let E = N[0], S = N[1], M = N[2]
var res = 1, u1 = 1, u2 = 1, u3 = 1

while E != u1 || S != u2 || M != u3 {

    u1+=1
    u2+=1
    u3+=1
    res+=1
    
    if u1 == 16 { u1 = 1 }
    if u2 == 29 { u2 = 1 }
    if u3 == 20 { u3 = 1 }
}
print(res)
