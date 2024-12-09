from collections import Dict, Set
from utils import StringSlice

alias FILE = "2.txt"

fn parsePart1(data: List[String]) raises -> Tuple[Dict[Int, List[Int]], List[List[Int]]]:
    # x1|y, x2|y --> {y: [x1, x2]}
    requirements = Dict[Int, List[Int]]()
    first_half = data[0].splitlines()
    for req_str in first_half:
        req_str_split  = req_str[].split('|')
        y = int(req_str_split[1])
        x = int(req_str_split[0])

        if y not in requirements:
            requirements[y] = List[Int]()
        requirements[y].append(x)

    answers = List[List[Int]]()
    second_half = data[1].splitlines()
    for line in second_half:
        local_answer = List[Int]()
        line_split = line[].split(',')
        for line_split_str in line_split:
            local_answer.append(int(line_split_str[]))
        answers.append(local_answer^)
    return requirements, answers
     
fn validate_part1(data: List[Int], requirements: Dict[Int, List[Int]]) raises -> Bool:
    seen = Set[Int]()

    for k in requirements:
        seen.add(k[])
        for v in requirements[k[]]:
            seen.add(v[])

    for n in data:
        seen.remove(n[])

    for n in data:
        cur = n[]
        seen.add(cur)
        if cur not in requirements:
            continue

        cur_reqs = requirements[cur]
        for req in cur_reqs:
            if req[] not in seen:
                return False
    return True 


fn part1() raises:
    with open(FILE, 'r') as f:
        requirements, data = parsePart1(f.read().split("\n\n"))
        answer = 0
        for update in data:
            if not validate_part1(update[], requirements):
                continue   
            cur_list = update[]
            answer += cur_list[len(cur_list) // 2]
        print("Part 1:", answer)


fn part2() raises:
    with open(FILE, 'r') as f:
        requirements, data = parsePart1(f.read().split("\n\n"))
        answer = 0

        # return true if a goes before b
        @parameter 
        fn sort_fn(a: Int, b: Int) -> Bool:
            var maybe_reqs = requirements.get(a)
            if not maybe_reqs:
                return True 

            var reqs = maybe_reqs.take()
            for n in reqs:
                if n[] == b:
                    return False 
            return True 

        for update in data:
            if not validate_part1(update[], requirements):
                sort[cmp_fn=sort_fn](update[])
                cur_list = update[]
                answer += cur_list[len(cur_list) // 2]
        print("Part 2:", answer)

fn main() raises:
    part1()
    part2()
