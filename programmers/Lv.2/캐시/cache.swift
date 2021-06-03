func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cityList = cities.map{$0.lowercased()}
    var cache = [String]()
    var time = 0
    if cities.count == 0 { return 0 }
    else if cities.count == 1 { return 5}
    else if cacheSize == 0 { return cities.count*5 }
    while !cityList.isEmpty {
        if cache.isEmpty {
            cache.append(cityList.removeFirst())
            time+=5
        } else if cache.contains(cityList.first!) {
            cache.remove(at: cache.firstIndex(of: cityList.first!)!)
            cache.append(cityList.removeFirst())
            time+=1
        } else {
            cache.append(cityList.removeFirst())
            time+=5
        }
        if cache.count > cacheSize {
            cache.removeFirst()
        }

    }
    return time
}
