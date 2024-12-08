from collections import Dict 
from utils import StringSlice

alias FILE = "2.txt"

var S_EXPECT_M = 0
var S_EXPECT_U = 1
var S_EXPECT_L = 2 
var S_EXPECT_LPAREN = 3
var S_PARSE_NUM1 = 4
var S_PARSE_NUM2 = 5

fn getDigit(d: StringSlice) raises -> Int:
    if d[0].isdigit():
        return int(d[0])
    return -1

fn parsePart1(data: String) raises -> List[Tuple[Int, Int]]:
    var state = S_EXPECT_M

    var num1 = 0
    var num2 = 0
    var answer = List[Tuple[Int, Int]]()
    for ch in data:
        if state == S_EXPECT_M:
            if ch == "m":
                state += 1
            else:
                state = S_EXPECT_M
        elif state == S_EXPECT_U:
            if ch == "u":
                state += 1
            else:
                state = S_EXPECT_M        
        elif state == S_EXPECT_L:
            if ch == "l":
                state += 1
            else:
                state = S_EXPECT_M             
        elif state == S_EXPECT_LPAREN:
            if ch == "(":
                state += 1
            else:
                state = S_EXPECT_M            
        elif state == S_PARSE_NUM1:
            var digit = getDigit(ch)
            if ch == ",":
                state += 1
            elif digit >= 0:
                num1 = num1 * 10 + digit
            else: 
                state = S_EXPECT_M            
                num1 = 0
                num2 = 0
        else:
            # state == S_PARSE_NUM2
            var digit = getDigit(ch)
            if digit >= 0:
                num2 = num2 * 10 + digit
            else: 
                if ch == ")":
                    answer.append((num1, num2))
                state = S_EXPECT_M            
                num1 = 0
                num2 = 0
    return answer 

fn part1() raises:
    with open(FILE, 'r') as f:
        lines = f.read()
        data = parsePart1(lines)
        answer = 0
        for v in data:
            answer += v[].get[0, Int]() * v[].get[1, Int]()
        print("Part1:", answer)

fn parsePart2(data: String) raises -> List[Tuple[Int, Int]]:
    var state = S_EXPECT_M

    var num1 = 0
    var num2 = 0
    var answer = List[Tuple[Int, Int]]()
    for ch in data:
        if state == S_EXPECT_M:
            if ch == "m":
                state += 1
            else:
                state = S_EXPECT_M
        elif state == S_EXPECT_U:
            if ch == "u":
                state += 1
            else:
                state = S_EXPECT_M        
        elif state == S_EXPECT_L:
            if ch == "l":
                state += 1
            else:
                state = S_EXPECT_M             
        elif state == S_EXPECT_LPAREN:
            if ch == "(":
                state += 1
            else:
                state = S_EXPECT_M            
        elif state == S_PARSE_NUM1:
            var digit = getDigit(ch)
            if ch == ",":
                state += 1
            elif digit >= 0:
                num1 = num1 * 10 + digit
            else: 
                state = S_EXPECT_M            
                num1 = 0
                num2 = 0
        else:
            # state == S_PARSE_NUM2
            var digit = getDigit(ch)
            if digit >= 0:
                num2 = num2 * 10 + digit
            else: 
                if ch == ")":
                    answer.append((num1, num2))
                state = S_EXPECT_M            
                num1 = 0
                num2 = 0
    return answer 

fn part2_subanswer(data: List[Tuple[Int, Int]]) -> Int:
    answer = 0
    for v in data:
        answer += v[].get[0, Int]() * v[].get[1, Int]()
    return answer 

fn part2() raises:
    with open(FILE, 'r') as f:
        lines = f.read()
        disabled_sections = lines.split("don't()")  

        answer = part2_subanswer(parsePart1(disabled_sections[0]))
        for disabled_section in disabled_sections[1:]:
            reenabled_sections = disabled_section[].split("do()") 
            for reenabled_section in reenabled_sections[1:]:
                answer += part2_subanswer(parsePart1(reenabled_section[]))

        print("part2:", answer)


fn main() raises:
    part1()
    part2()