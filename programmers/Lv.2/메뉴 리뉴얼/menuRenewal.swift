import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var newCourse = [String:Int]()

    func combination(_ menu: [String], _ n: Int, _ result: String) {
        if course.contains(result.count) && result.count > 1 {
            if newCourse[result] == nil {
                newCourse[result] = 1
            } else {
                newCourse[result]? += 1
            }
        }
        for i in (n+1)..<menu.count {
            combination(menu, i, "\(result)\(menu[i])")
        }
    }

    for order in orders {
        let newMenu = order.map{String($0)}.sorted()
        for i in newMenu.indices {
            combination(newMenu, i, "\(newMenu[i])")
        }
    }

    var res = [String]()

    for n in course {
        let maxKey = newCourse.filter{ $0.key.count == n && $0.value > 1}.max { $0.value < $1.value }
        if let maxKey = maxKey {
            newCourse.filter{ $0.key.count == n}.forEach {
                if $0.value == maxKey.value {
                    res.append($0.key)
                }
            }
        }
    }
    return res.sorted()
}
