var d = [1:[], 2:["A","B","C"],
         3:["D","E","F"], 4:["G","H","I"],
         5:["J","K","L"], 6:["M","N","O"],
         7:["P","Q","R","S"], 8:["T","U","V"],
         9:["W","X","Y","Z"], 0:[]]
var res = 0
for c in readLine()!.map({String($0)}) {
    for dic in d where dic.value.contains(c) {
        res+=dic.key+1
    }
}
print(res)
