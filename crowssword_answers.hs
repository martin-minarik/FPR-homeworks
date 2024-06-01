import Data.List (transpose)

type Result = ([String], [String])
type Crossword = [String]

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

get_words :: Crossword -> [String]
get_words lines = concat [[word|word <- words line, length word > 1]|line <- lines]


answers :: Crossword -> Result
answers crossword = (horizontal_words, vertical_words) where
                horizontal_words = get_words crossword
                vertical_words = get_words $ transpose crossword

print_result :: Result -> IO ()
print_result result = do
  let (horizontal_words, vertical_words) = result
  putStrLn "Horizontal Words:"
  putStr $ unlines horizontal_words
  putStrLn "\nVertical Words:"
  putStr $ unlines vertical_words

-- main = print $ get_words crossword1

-- main = print $ answers crossword1

-- main = print_result $ answers crossword1
