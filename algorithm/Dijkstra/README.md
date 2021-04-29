### 다익스트라 최단경로 알고리즘은?

- 하나의 정점에서 다른 모든 정점으로 가는 최단경로를 탐색
- 즉, 정해진 출발점에서부터 도달할 수 있는 모든 도착점까지의 최단경로를 탐색하는 경우 사용
- 다만, 정점과 정점 사이의 간선이 음수인 경우에는 사용 불가

현실 세계에서는 음의 간선이 존재하지 않기 때문에 다익스트라는 인공위성, GPS 등에서 사용되는 실용적인 알고리즘입니다.

### 다이나믹 프로그래밍(DP)

- 하나의 최단거리는 여러개의 최단거리의 합
- 다익스트라는 최단경로 탐색을 위해 이전까지 구했던 최단 거리 정보를 그대로 사용 => DP의 개념
<img width="257" alt="스크린샷 2021-04-29 오전 8 55 52" src="https://user-images.githubusercontent.com/74946802/116486513-c8292f80-a8c8-11eb-9cbc-964656ea58aa.png">

- 1에서 3으로 이동하는 최단경로의 현재 값은 7
- 1에서 2로 이동하는 최단경로의 현재 값은 3
- 2에서 3으로 이동하는 최단경로의 현재 값은 1
- 1에서 2를 통해 3으로 이동하면, 1에서 3으로 바로 이동하는 경우보다 적은 값으로 이동 가능하기 때문에 최단경로 값이 4로 업데이트
- 즉, 특정거리까지의 최단경로를 탐색하기 위해 이전까지 구해졌던 최단거리 정보를 그대로 사용

### 구현
- 출발점을 설정 
- 출발점에서 부터 모든 도착점까지의 최단거리를 설정
- 방문하지 않은 노드를 모두 탐색
  - 간선의 경로 값이 가장 적은 값부터 탐색
- 해당 노드에서부터 도달 가능한 노드의 모든 경로값 업데이트
<img width="275" alt="스크린샷 2021-04-29 오전 9 03 42" src="https://user-images.githubusercontent.com/74946802/116486961-cd3aae80-a8c9-11eb-990a-bd9dc20193a7.png">

- 1을 출발점으로 모든 노드까지의 최단경로는
  - 1에서 1까지 최단경로 => 0
  - 1에서 2까지 최단경로 => 1
  - 1에서 3까지 최단경로 => 2
  - 1에서 4까지 최단경로 => 3
  - 1에서 5까지 최단경로 => 불가(이 경우 무한대 값으로 설정)
- 즉, [0, 1, 2, 3, INF]가 출발점으로부터 모든 노드까지의 최단경로 값
<img width="253" alt="스크린샷 2021-04-29 오전 9 06 49" src="https://user-images.githubusercontent.com/74946802/116487143-3f12f800-a8ca-11eb-991f-abbadc630b60.png">

- 위에서 언급한 대로 가장 작은 최단경로 값(1)을 가진 정점 2부터 탐색
  - 1에서 2로의 이동비용 => 1
  - 2에서 4로의 이동비용 => 1
  - 1에서 2를 거쳐 4로 이동하는 비용 => 2
  - 1에서 4로 바로 이동하는 비용 => 3
  - 2를 거칠 때 비용이 바로 이동하는 비용보다 적기때문에
  - 최단거리 정보 업데이트
  - [0, 1, 2, 2, INF]

- 정점 2에서 도달 가능한 정점인 5번으로의 이동비용 탐색
  - 1에서 2로의 이동비용 => 1
  - 2에서 5로의 이동비용 => 3
  - 1에서 2를 거쳐 5로 이동하는 비용 => 4
  - 1에서 5로 바로 이동하는 비용 => 무한대
  - 2를 거칠 때 비용이 바로 이동하는 비용보다 적기때문에
  - 최단거리 정보 업데이트
  - [0, 1, 2, 2, 4]

이런 방식으로 최단거리 정보가 갱신된다.

### 활용 문제

- [다익스트라를 활용하여 연습해볼 문제](https://programmers.co.kr/learn/courses/30/lessons/12978?language=python3)

### 풀이코드
- 최소힙을 사용해야 dijkstra의 시간복잡도가 O(nlogn)
- 선형탐색을 사용하는 경우 O(n2)

```python
import heapq

def solution(N, road, K):
    maxNum = 1e9
    graph = [ [] for _ in range(N+1)]

    for node in road:
        a, b, cost = node[0], node[1], node[2]
        graph[a].append((b, cost))
        graph[b].append((a, cost))

    distance = [maxNum] * (N+1)
    distance[1] = 0
    q = []
    heapq.heappush(q, (0, 1))

    while q:
        nCost, now = heapq.heappop(q)

        if distance[now] < nCost:
            continue

        for node in graph[now]:
            updateCost = nCost + node[1]
            if updateCost < distance[node[0]]:
                distance[node[0]] = updateCost
                heapq.heappush(q, (updateCost, node[0]))

    return len(list(filter(lambda x : x<=K, distance)))
```
