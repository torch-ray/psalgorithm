func solution(_ s:String, _ n:Int) -> String {
    let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    var res = ""
    
    for i in s {
        let isUpperCase = i.isUppercase
        
        if let index = alphabet.firstIndex(of: i.lowercased()) {
            let nowIndex = index + n > 25 ? index + n - 26 : index + n
            res += isUpperCase ? alphabet[nowIndex].uppercased() : alphabet[nowIndex]
        } else {
            res += " "
        }
    }
    return res
}
