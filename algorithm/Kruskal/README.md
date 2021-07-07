### 크루스칼 알고리즘
>  크루스칼(Kruskal) 알고리즘 이란?
- 최소비용 신장 트리를 찾는 알고리즘
- 가장 낮은 값으로 정렬하고 우선 연결한 뒤에, 사이클을 제외하는 알고리즘 
- 즉, 모든 노드를 가장 적은 비용으로 연결하기 위해 사용하는 알고리즘

### 구현
> 비용이 작은 순서로 정렬

<img width="353" alt="스크린샷 2021-07-07 오후 9 10 43" src="https://user-images.githubusercontent.com/74946802/124756839-e2862600-df67-11eb-9a81-0bcef339c3c8.png">

- 위와 같이 노드와 간선의 정보가 주어질 때, 비용이 적게 드는 순서로 정렬<br/>
- [ [1, 4, 1], [2, 4, 2], [4, 5, 5], [1, 2, 7], [1, 3, 10] ] (0번 인덱스에서 1번 인덱스로 이동비용이 2번 인덱스)<br/>   


<img width="353" alt="스크린샷 2021-07-07 오후 9 10 48" src="https://user-images.githubusercontent.com/74946802/124756845-e44fe980-df67-11eb-95bc-41c900739282.png">

- 1번과 4번 노드를 이어주고 비용값(1)을 더해줌<br/>  
- 이 때, 더 작은 숫자가 부모 노드가 됨 (이 경우에는 1)<br/>


<img width="354" alt="스크린샷 2021-07-07 오후 9 17 15" src="https://user-images.githubusercontent.com/74946802/124757672-ccc53080-df68-11eb-9aca-b6df5962b5bb.png">

- 2번과 4번 노드를 이어주고 비용값(2)을 더해줌<br/> 
- 2번과 4번 중 2번이 더 작지만, 이미 4번의 부모 노드가 1이기 때문에 2번의 부모 노드도 1로 저장<br/>


<img width="357" alt="스크린샷 2021-07-07 오후 9 11 03" src="https://user-images.githubusercontent.com/74946802/124756853-e5811680-df67-11eb-80f7-c848d2dafcd8.png">

- 마찬가지로 4번과 5번 노드를 이어주고 비용값(5)을 더해줌<br/>
- 위 로직과 마찬가지로 부모 노드는 1로 저장<br/>

<img width="359" alt="스크린샷 2021-07-07 오후 9 17 31" src="https://user-images.githubusercontent.com/74946802/124757665-cafb6d00-df68-11eb-9a5f-6efcfb556af6.png">

- 1번과 2번을 이어주려고 했지만 둘 모두 부모 노드가 1로 같기 때문에 제외 (사이클이 형성되는 경우 중복제거를 위해 삭제)

<img width="349" alt="스크린샷 2021-07-07 오후 9 11 08" src="https://user-images.githubusercontent.com/74946802/124756856-e619ad00-df67-11eb-8d1f-5d8f8227663e.png">

- 1번과 3번을 이어주고 비용값(10)을 저장
- 모든 저장한 비용값(18)이 모든 노드를 연결하는 최소연결 비용

### 활용문제
[크루스칼 알고리즘을 활용하여 연습해볼 문제](https://programmers.co.kr/learn/courses/30/lessons/42861?language=swift)

### 풀이코드
- 간선(Edge)과 노드(Vertex)가 주어지면 ElogV 의 시간복잡도를 가짐
- 모든 노드를 연결하는 최소 비용을 찾는 문제에 유용하게 사용

```swift
func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var parents = (0..<n).map{$0}
    let costs = costs.sorted {$0[2] < $1[2]}
    
    func isCycle(_ left:Int, _ right:Int) -> Bool {
        return parents[left] == parents[right]
    }
    
    func getParents(_ child:Int) -> Int {
        return parents[child] == child ? child : getParents(parents[child])
    }
    
    func makeBridge(_ left:Int, _ right:Int) {
        let new = getParents(left)
        let old = getParents(right)
        parents.indices.filter {parents[$0] == old}.forEach {parents[$0] = new}
    }
    
    var res = 0
    for cost in costs {
        if !isCycle(cost[0], cost[1]) {
            makeBridge(cost[0], cost[1])
            res += cost.last!
        }
    }
    
    return res
}
```

