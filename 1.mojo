from collections import Dict 

alias FILE = "1.txt"

fn part1() raises:
    var left = List[Int]()
    var right = List[Int]()    
    with open(FILE, 'r') as f:
        lines = f.read().splitlines()
        for i in range(len(lines)):
            cur = lines[i] 
            values = cur.split(' ')

            left.append(int(values[0]))
            right.append(int(values[-1]))

    sort(left)
    sort(right)
    var distance: Int = 0
    for i in range(len(left)):
        distance += abs(left[i] - right[i])
    print("Part 1 distance:", distance)


fn part2() raises:
    var left = List[Int]()
    var right = List[Int]()
    var right_counts = Dict[Int, Int]()

    with open(FILE, 'r') as f:
        lines = f.read().splitlines()
        for i in range(len(lines)):
            cur = lines[i] 
            values = cur.split(' ')

            left.append(int(values[0]))

            var right_val = int(values[-1])
            right.append(right_val)

            if right_val not in right_counts:
                right_counts[right_val] = 0
            right_counts[right_val] += 1
    var similarity: Int = 0
    for i in range(len(left)):
        n = left[i]
        if n in right_counts:
            similarity += n * right_counts[n]
    print("Part 2 distance:", similarity)

fn main() raises:
    part1()
    part2()