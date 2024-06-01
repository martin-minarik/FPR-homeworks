type Picture = [String]

pprint :: Picture -> IO ()
pprint = putStr . unlines

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

is_within :: Picture -> (Int, Int) -> Bool
is_within lst (x, y) = (x >= 0 && x < length (lst !! 0))
                     && (y >= 0 && y < length lst)

replace :: String -> Int -> Char -> String
replace line x replacement = (take x line) ++ [replacement] ++ (drop (x+1) line)

replace_xy :: Picture -> (Int,Int) -> Char -> Picture
replace_xy picture (x, y) replacement = if not $ is_within picture (x, y) then picture else above ++ [line] ++ below where
                                    above = take y picture
                                    line = replace (picture !! (y)) x replacement
                                    below = drop (y + 1) picture

fill :: Picture -> (Int,Int) -> Picture
fill picture (x, y) = case ((not $ is_within picture (x, y)) || (picture !! y) !! x /= '.') of
                    True -> picture
                    False -> fill_right
                            where
                                fill_up = fill (replace_xy picture (x, y) '*') (x, y-1)
                                fill_left = fill fill_up (x-1, y)
                                fill_down = fill fill_left (x, y+1)
                                fill_right = fill fill_down (x+1, y)


invert_color :: Picture -> Picture
invert_color picture = [[swap c|c <- line]|line <- picture] where
                    swap:: Char -> Char
                    swap '.' = '*'
                    swap '*' = '.'
                    swap c = c

-- main = pprint $ fill picture1 (7, 5)

-- main = pprint $ fill picture1 (0, 0)

-- main = pprint . invert_color $ fill picture1 (0, 0)
