from collections import Dict 

alias FILE = "2.txt"

fn part1_validate(data: List[Int]) -> Bool:
    var lastDiff = data[1] - data[0]
    for i in range(len(data) - 1):
        var diff = data[i + 1] - data[i]
        if abs(diff) > 3 or abs(diff) < 1:
            return False 
        if (lastDiff > 0) != (diff > 0):
            return False 
    return True 

fn part1() raises:
    data = List[List[Int]]()
    with open(FILE, 'r') as f:
        lines = f.read().splitlines()
        for i in range(len(lines)):
            cur = lines[i] 
            values = cur.split(' ')
            var cur_list = List[Int]()
            for i in range(len(values)):
                cur_list.append(int(values[i]))
            data.append(cur_list^)

    ans = 0
    for report in data:
        ans += part1_validate(report[])
    print("Part 1:", ans)


fn part2_validate(data: List[Int]) -> Bool:
    if part1_validate(data):
        return True 
    for i in range(len(data)):
        if part1_validate(data[:i] + data[i + 1:]):
            return True 
    return False 

fn part2() raises:
    data = List[List[Int]]()
    with open(FILE, 'r') as f:
        lines = f.read().splitlines()
        for i in range(len(lines)):
            cur = lines[i] 
            values = cur.split(' ')
            var cur_list = List[Int]()
            for i in range(len(values)):
                cur_list.append(int(values[i]))
            data.append(cur_list^)

    ans = 0
    for report in data:
        ans += part2_validate(report[])
    print("Part 2:", ans)

fn main() raises:
    part1()
    part2()
