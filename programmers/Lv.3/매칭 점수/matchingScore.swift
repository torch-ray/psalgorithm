import Foundation

extension String{
    func getAllMatchAfterRegex(_ pattern: String, _ option: NSRegularExpression.Options) -> [String] {

        do {
            let regex = try NSRegularExpression(pattern: pattern, options: option)
            let range = NSRange(self.startIndex..., in: self)
            let matches = regex.matches(in: self, range: range)
            return matches.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch {
            return []
        }
    }
}

func solution(_ word:String, _ pages:[String]) -> Int {

    var dict: [String:(Int, Int, [String])] = [:]

    for (idx, page) in pages.enumerated() {
        let head = page.getAllMatchAfterRegex("<head>(.+)</head>", .dotMatchesLineSeparators)
        let meta = head.first!.getAllMatchAfterRegex("<meta (.+)>", .dotMatchesLineSeparators)
        let selfLink = meta.first!.getAllMatchAfterRegex("(?<=meta property=\"og:url\" content=\"https://)([^\"]+)", .dotMatchesLineSeparators).first!

        let wordsList = page.getAllMatchAfterRegex("[a-zA-Z]+", [])
        let score = wordsList.filter{$0.lowercased() == word.lowercased() }.count

        let external = Set(page.getAllMatchAfterRegex("(?<=<a href=\"https://)([^\"]+)", .dotMatchesLineSeparators))
        let exLinks = Array(external)
        dict[selfLink] = (idx, score, exLinks)
    }

    var res = [Double](repeating: 0, count: pages.count)
    for (idx, val) in dict.values.sorted(by: { $0.0 < $1.0 }).enumerated() {
        res[idx] += Double(val.1)
        for exLink in val.2 {
            if let key = dict[exLink] {
                res[key.0] += Double(val.1) / Double(val.2.count)
            }
        }
    }

    return res.firstIndex(of: res.max()!)!
}
