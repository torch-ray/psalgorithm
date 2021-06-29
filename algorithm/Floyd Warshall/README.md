## 플로이드 와샬 알고리즘
> 다익스트라 알고리즘과 마찬가지로 최단경로 탐색 알고리즘
- 다익스트라가 하나의 정점에서 다른 모든 정점으로의 최단거리를 탐색하는 알고리즘이라면
- 플로이드 와샬은 모든 정점에서 모든 정점으로의 최단경로를 탐색하는 알고리즘
- 즉, 하나의 정점에서 다른 정점으로의 최단거리를 구할 때는 다익스트라, 모든 정점에서 모든 정점으로의 최단거리르 구할 때는 플로이드 와샬 알고리즘을 사용

### 다이나믹 프로그래밍(DP)

- 거쳐가는 정점을 기준으로 최단거리를 업데이트하기 때문에 기본적으로 DP의 개념
<img width="398" alt="스크린샷 2021-06-29 오후 7 21 22" src="https://user-images.githubusercontent.com/74946802/123781423-31e8a880-d90f-11eb-89d6-3acedb24c934.png">

- 1에서 연결된 경로 [0, 1, 9, 불가]
- 2에서 연결된 경로 [3, 0, 2, 불가]
- 3에서 연결된 경로 [불가, 불가, 0, 2]
- 4에서 연결된 경로 [1, 불가, 3, 0]
- 자기 자신과의 거리는 0으로, 직접 연결되어 있지 않은 경우는 불가로 표시
- 이제 모든 노드를 거쳐서 다른 노드로 도착하는 경우와 현재 값을 비교하여 최단거리 업데이트

### 구현
> e.g. 노드 1에서 3으로 이동하는 경우
- 현재 노드 1에서 3으로 이동하는 거리는 9
- 노드 2를 거쳐서가면 1에서 2로 이동하는 거리 1, 2에서 3으로 이동하는 거리 2로 합이 3
- 1에서 연결된 경로의 정보가 [0, 1, 3, 불가]로 업데이트
- 노드 4를 거쳐서는 갈 수 없기 때문에 1에서 3으로 이동하는 최단거리는 3으로 확정
- 이러한 방식으로 A노드에서 B노드로 이동하는 최단거리와 A에서 다른 노드를 경유하여 B로 이동하는 거리를 모두 비교하여 가장 작은 값(최단 경로)으로 업데이트


### 활용 문제

- [플로이드 와샬을 활용하여 연습해볼 문제](https://programmers.co.kr/learn/courses/30/lessons/72413?language=swift)

### 풀이코드
- 거쳐가는 노드, 출발 노드, 도착 노드의 정보가 필요하기 때문에 3중 for-loop를 활용
- for-loop의 순서도 거쳐가는 노드, 출발 노드, 도착 노드 순서로 구현

```swift
func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var distance = [[Int]](repeating: [Int](repeating: 999999, count: n), count: n)
    
    for i in 0..<n {
        distance[i][i] = 0
    }
    
    
    for fare in fares {
        distance[fare[0]-1][fare[1]-1] = fare[2]
        distance[fare[1]-1][fare[0]-1] = fare[2]
    }
    
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }
    
    var res = 99999999
    
    for node in 0..<n {
        res = min(res, distance[s-1][node] + distance[node][a-1] + distance[node][b-1])
    }
    
    return res
}
```
