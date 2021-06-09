func skillCheck(_ s: String, _ e: String) -> Bool {
    let tmp = e.filter{s.contains($0)}
    return s.hasPrefix(tmp)
}

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    return skill_trees.map{skillCheck(skill, $0)}.filter{$0}.count
}
