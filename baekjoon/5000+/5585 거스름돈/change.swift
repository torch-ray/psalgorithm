var N = 1000 - Int(readLine()!)!, cnt = 0
let C = [500, 100, 50, 10, 5, 1]

for c in C where N >= c {
    cnt += N/c
    N = N%c
    if N == 0 { break }
}
print(cnt)
