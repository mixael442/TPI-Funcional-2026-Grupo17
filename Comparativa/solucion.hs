recursion :: Int -> Int
recursion 1 = 1
recursion 2 = 1
recursion n = recursion (n - 2) + recursion (n - 1)