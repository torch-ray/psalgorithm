import Foundation

func parseFile(_ files:[String]) -> [[String]] {
    var res:[[String]] = []
    for file in files {
        let headerRange = file.range(of: "^[\\D ]+", options: [.regularExpression])
        let head = "\(file[headerRange!])"
        let extra = file[headerRange!.upperBound...]
        let numRange = extra.range(of: "\\d{1,5}", options: [.regularExpression])
        let number = "\(extra[numRange!])"
        let tail = "\(extra[numRange!.upperBound...])"
        res.append([head, number, tail])
    }
    return res
}

func solution(_ files:[String]) -> [String] {
    var parsed = parseFile(files)
    var res:[String] = []
    parsed.sort{ $0.first!.lowercased() != $1.first!.lowercased() ? $0.first!.lowercased() < $1.first!.lowercased() : Int($0[1])! < Int($1[1])!}

    for file in parsed {
        res.append(file.joined())
    }
    return res
}
