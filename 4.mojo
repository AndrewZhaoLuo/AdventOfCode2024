from collections import Dict 
from utils import StringSlice

alias FILE = "2.txt"

var X = 1
var M = 2
var A = 4
var S = 8
var OTHER = 16

fn parsePart1(data: List[String]) -> List[List[Int8]]:
    var answer = List[List[Int8]]()

    for line in data:
        line_data = List[Int8]()
        for ch in line[]:
            if ch == 'X':
                line_data.append(X)
            elif ch == 'M':
                line_data.append(M)
            elif ch == 'A':
                line_data.append(A)
            elif ch == 'S':
                line_data.append(S)
            else:
                line_data.append(OTHER)
        answer.append(line_data^)

    return answer 

fn search(data: List[List[Int8]], r: Int, c: Int, deltas: List[List[Int]], expect: Int8) -> Int:
    if r >= len(data) or r < 0:
        return 0
    if c >= len(data[0]) or c < 0:
        return 0
    if data[r][c] != expect:
        return 0
    if expect == S:
        return 1
    answer = 0
    for delta in deltas:
        answer += search(data, r + delta[][0], c + delta[][1], deltas, expect * 2)

    return answer 

fn part1() raises:
    with open(FILE, 'r') as f:
        data = parsePart1(f.read().splitlines())
        answer = 0
        for r in range(len(data)):
            for c in range(len(data[0])):
                var all_deltas = List[List[Int]](
                    List[Int](1, 0),
                    List[Int](-1, 0),
                    List[Int](0, 1),
                    List[Int](0, -1),
                    List[Int](1, -1),
                    List[Int](1, 1),
                    List[Int](-1, 1),
                    List[Int](-1, -1),
                )
                for d in all_deltas:
                    answer += search(data, r, c, List[List[Int]](d[]), X)

        print("Part1:", answer)

fn part2() raises:
    with open(FILE, 'r') as f:
        data = parsePart1(f.read().splitlines())
        answer = 0
        for r in range(len(data)):
            for c in range(len(data[0])):
                if data[r][c] != A:
                    continue 
                diag1 = search(data, r - 1, c - 1, List[List[Int]](List[Int](1, 1)), M) + search(data, r + 1, c + 1, List[List[Int]](List[Int](-1, -1)), M)
                diag2 = search(data, r - 1, c + 1, List[List[Int]](List[Int](1, -1)), M) + search(data, r + 1, c - 1, List[List[Int]](List[Int](-1, 1)), M)
                if diag1 and diag2:
                    answer += 1

        print("Part2:", answer)



fn main() raises:
    part1()
    part2()
