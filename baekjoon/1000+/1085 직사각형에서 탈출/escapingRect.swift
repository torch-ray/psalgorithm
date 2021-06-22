let input = readLine()!.split{$0==" "}.map{Int(String($0))!}
let (x, y, w, h) = (input[0], input[1], input[2], input[3])
print(min(x, y, h-y, w-x))
