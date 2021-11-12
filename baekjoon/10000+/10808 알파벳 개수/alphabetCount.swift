var A = [Int](repeating: 0, count: 26)

let S = readLine()!

for char in S {
    A[Int(char.asciiValue!) - 97] += 1
}

for num in A {
    print(num, terminator: " ")
}
