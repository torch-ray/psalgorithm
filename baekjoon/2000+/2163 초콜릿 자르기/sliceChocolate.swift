print(readLine()!.split{$0==" "}.map{Int(String($0))!}.reduce(1,*)-1)
