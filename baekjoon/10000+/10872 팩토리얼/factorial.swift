let n = Int(readLine()!)!
print(n == 0 ? 1 : (1...n).reduce(1,*))
