type Dict = [(Char, String)]

dictionary1 :: Dict
dictionary1 = [('a',"0"),('b',"101"),('c',"100"),('d',"111"),('e',"1101"),('f',"1100")]

get_substring :: String->Int->Int->Maybe String
get_substring string start end = if end > length string then Nothing else Just $ take (end - start) $ drop start string

get_key :: Dict->String->Maybe Char
get_key [] _ = Nothing
get_key (item:rest) value = if snd item == value then Just (fst item) else get_key rest value

get_value :: Dict->Char->Maybe String
get_value [] _ = Nothing
get_value (item:rest) key = if key == fst item then Just (snd item) else get_value rest key

toText :: String->Dict->String
toText text dict = decode text 0 1 where
                    decode:: String->Int->Int->String
                    decode string start end = let
                        substring = get_substring string start end
                        in case substring of
                            Nothing -> ""
                            Just substring -> let
                                key = get_key dict substring
                                in case key of
                                    Nothing -> decode string start (end + 1)
                                    Just key -> key : decode string end (end + 1)


encode :: String->Dict->String
encode [] _ = ""
encode (chr:rest) dict = let
                        value = get_value dict chr
                        in case value of
                            Nothing -> ""
                            Just value -> value ++ encode rest dict
                            
-- main = putStrLn $ encode "abcde" dictionary1
-- main = putStrLn $ toText "01011001111101" dictionary1

-- main = putStrLn $ encode "cafe" dictionary1
-- main = putStrLn $ toText "100011001101" dictionary1

-- main = putStrLn $ encode "face" dictionary1
-- main = putStrLn $ toText "110001001101" dictionary1

-- main = putStrLn $ encode "bad" dictionary1
-- main = putStrLn $ toText "1010111" dictionary1
