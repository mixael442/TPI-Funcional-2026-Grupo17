calcuTimer :: Int -> String
calcuTimer tiempo = calcuTiempo tiempo 90 6 120

calcuTiempo :: Int -> Int -> Int -> Int -> [Char]
calcuTiempo tiempo rojo amarillo verde = compararRem (mod tiempo (rojo + amarillo + verde))

compararRem :: Int -> String
compararRem resto
  | resto < 90 = "en-rojo"
  | resto < 96 = "en-amarillo"
  | resto >= 96 = "en-verde"
  | otherwise = "error"