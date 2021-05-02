func zipString(_ s:String, len:Int) -> Int {
    var (res, arr) = ([String](), [String]())
    var (searchCnt, wordCnt, rem) = (0, 0, 0)
    var word = ""
    
    if s.count % len == 0 {
        searchCnt = s.count/len
    } else {
        searchCnt = s.count/len
        rem = s.count%len
    }
    
    var firstIndex = s.index(s.startIndex, offsetBy: 0)
    var lastIndex = s.index(s.startIndex, offsetBy: 0)
    
    for _ in 0..<searchCnt {
        lastIndex = s.index(lastIndex, offsetBy: len)
        arr.append(String(s[firstIndex..<lastIndex]))
        firstIndex = lastIndex
    }

    for i in 0..<searchCnt {
        if word == "" {
            word = arr[i]
            wordCnt+=1
        } else {
            if word == arr[i] {
                wordCnt+=1
            } else {
                if wordCnt == 1 {
                    res.append(word)
                } else {
                    res.append("\(wordCnt)\(word)")
                }
                wordCnt=1
                word=arr[i]
            }
        }
    }
    
    wordCnt==1 ? res.append(word):res.append("\(wordCnt)\(word)")
    return res.joined().count + rem
}

func solution(_ s:String) -> Int {
    let len = s.count/2
    var minArr = [Int]()
    
    if s.count==1 { return 1}
    
    for len in 1...len {
        let minNum = zipString(s, len: len)
        minArr.append(minNum)
    }
    
    return minArr.min()!
}
