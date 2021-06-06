func removeZero(_ s:String, _ c:Int) -> (String, Int) {
    var cnt = c
    for element in s {
        if element == "0" {
            cnt+=1
        }
    }
    return (s.split{$0=="0"}.joined(), cnt)
}

func binary(_ num:Int) -> String {
    var res = ""
    var num = num
    while num>0 {
        res+="\(num%2)"
        num = num/2
    }
    return String(res.reversed())
}


func solution(_ s:String) -> [Int] {
    var cnt = 0
    var s = s
    var cnt1 = 0

    while s != "1" {
        let tmp = removeZero(s, cnt)
        s = binary(tmp.0.count)
        cnt = tmp.1
        cnt1+=1
    }
    return [cnt1, cnt]
}
