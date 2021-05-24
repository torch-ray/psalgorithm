func solution(_ clothes:[[String]]) -> Int {
    var daily = [String:[String]]()

    for cloth in clothes {
        if daily[cloth[1]] == nil {
            daily[cloth[1]] = [cloth[0]]
        } else {
            daily[cloth[1]]?.append(cloth[0])
        }
    }
    let cnt = daily.mapValues{$0.count}.values

    return cnt.reduce(1){$0*($1+1)}-1
}
