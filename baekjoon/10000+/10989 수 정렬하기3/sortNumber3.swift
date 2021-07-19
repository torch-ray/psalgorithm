import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() }
        
        if now == 45 { isPositive.toggle(); now = read() }
        
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

if #available(OSX 10.15.4, *) {
    let fIO = FileIO()
    let n:Int = fIO.readInt()
    var countOfNums = [Int](repeating: 0, count: 10001)
    var str = ""
    
    for _ in 0..<n {
        let i = fIO.readInt()
        countOfNums[i] += 1
    }
    
    for i in 1...10_000 where countOfNums[i]>0 {
        str += String(repeating: "\(i)\n", count: countOfNums[i])
    }
    print(str)
}
