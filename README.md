# FPR homeworks

- **FPR 2021/2022**

## Homework 1 - Prefix Decoder

- [Specification](http://behalek.cs.vsb.cz/wiki/index.php?title=FP_Homework_1/en&oldid=2556#5_-_Prefix_Decoder)

- [My solution](prefix_decoder.hs)


### Description

**Function "`toText`"** decodes a **binary sequence into its original text** using **prefix coding**, such as [Huffman coding](https://en.wikipedia.org/wiki/Huffman_coding). Prefix coding ensures that no code is a prefix of another; for instance, if one letter is encoded as `"101"`, no other letter's code will start with `"101"`.

The function will take an encoded binary sequence (a string of `1s` and `0s`) and a `dictionary of character-to-binary-sequence pairs`. The goal is to decode the binary sequence and return the original text.

### Example Usage

- Dictionary

```haskell
dictionary1 :: Dict
dictionary1 = [('a',"0"),('b',"101"),('c',"100"),('d',"111"),('e',"1101"),('f',"1100")]
```

- Example1

```shell
ghci> putStrLn $ encode "abcde" dictionary1
01011001111101
ghci> putStrLn $ toText "01011001111101" dictionary1
abcde
```

- Example2

```shell
ghci> putStrLn $ encode "cafe" dictionary1
100011001101
ghci> putStrLn $ toText "100011001101" dictionary1
cafe
```

- Example3

```shell
ghci> putStrLn $ encode "face" dictionary1
110001001101
ghci> putStrLn $ toText "110001001101" dictionary1
face
```

- Example4

```shell
ghci> putStrLn $ encode "bad" dictionary1
1010111
ghci> putStrLn $ toText "1010111" dictionary1
bad
```

## Homework 1 - Crossword Answers

- [Specification](http://behalek.cs.vsb.cz/wiki/index.php?title=FP_Homework_1/en&oldid=2556#2_-_Crossword_Answers)

- [My solution](crowssword_answers.hs)

### Description

**Function "`answers`"** takes as an input a crosword puzzle's solution and outputs all words from this solution. Words are divided into two lists, first for lines (from left to right) and second for columns (from top to bottom). A word is written only if it is longer than just one character. 

### Example Usage

- Sample crossword

```haskell
crossword1 :: Crossword
crossword1 = ["DAD  SEND",
              "O EAST  A",
              "W A  ITSY",
              "NERF N T ",
              " A ARK U ",
              " S T SYNC",
              "MESH  A A",
              "A  EVER R",
              "NEAR  D D"]
```

- Example1
```haskell
ghci> get_words crossword1
["DAD","SEND","EAST","ITSY","NERF","ARK","SYNC","MESH","EVER","NEAR"]
```

- Example2
```
ghci> answers crossword1
(["DAD","SEND","EAST","ITSY","NERF","ARK","SYNC","MESH","EVER","NEAR"],["DOWN","MAN","EASE","DEAR","FATHER","STINKS","YARD","STUN","DAY","CARD"])
```

- Example3
```
ghci> print_result $ answers crossword1
Horizontal Words:
DAD
SEND
EAST
ITSY
NERF
ARK
SYNC
MESH
EVER
NEAR

Vertical Words:
DOWN
MAN
EASE
DEAR
FATHER
STINKS
YARD
STUN
DAY
CARD
```

## Homework 2 - Filling

- [Specification](http://behalek.cs.vsb.cz/wiki/index.php?title=FP_Homework_2&oldid=2426#3_-_Filling)

- [My solution](flood_fill.hs)

### Description

**Function "`fill`"** takes a picture and a starting position (a tuple **(x, y)**). It fills the continuous area of free cells starting from the defined starting position with the character `'*'`.

The `picture` is composed of `'.'` for a free spot and `'#'` for a filled spot.

### Example Usage

- Sample input
```haskell
picture1 :: Picture
picture1 = 
   ["....................",
    "....................",
    "....#####...........",
    "...##...##..........",
    "..##.....##.........",
    "..#.......#.........",
    "..#...############..",
    "..#...#...#......#..",
    "..##..#..##......#..",
    "...##.#.##.......#..",
    "....#####........#..",
    "......#..........#..",
    "......############..",
    "....................",
    "...................."]
```

- Example1

```haskell
ghci> pprint $ fill picture1 (7, 5)
....................
....................
....#####...........
...##***##..........
..##*****##.........
..#*******#.........
..#***############..
..#***#...#......#..
..##**#..##......#..
...##*#.##.......#..
....#####........#..
......#..........#..
......############..
....................
....................
```

- Example2

```haskell
ghci> pprint $ fill picture1 (0, 0)
********************
********************
****#####***********
***##...##**********
**##.....##*********
**#.......#*********
**#...############**
**#...#...#......#**
**##..#..##......#**
***##.#.##.......#**
****#####........#**
******#..........#**
******############**
********************
********************
```

- Example3

```haskell
ghci> pprint . invert_color $ fill picture1 (0, 0)
....................
....................
....#####...........
...##***##..........
..##*****##.........
..#*******#.........
..#***############..
..#***#***#******#..
..##**#**##******#..
...##*#*##*******#..
....#####********#..
......#**********#..
......############..
....................
....................
```
