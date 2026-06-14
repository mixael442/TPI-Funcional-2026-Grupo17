-- ==========================================================
-- FUNCIÓN: calcuTimer
-- NATURALEZA: Pura
-- ESTRATEGIA: Composición de Funciones, Delega el cálculo a calcuTiempo
-- IMPACTO: No Destructiva
-- ==========================================================
calcuTimer :: Int -> String
calcuTimer tiempo = calcuTiempo tiempo 90 6 120 3

-- ==========================================================
-- FUNCIÓN: calcuTiempo
-- NATURALEZA: Pura
-- ESTRATEGIA: Composición de Funciones + operaciones aritmeticas
-- IMPACTO: No Destructiva
-- ==========================================================
calcuTiempo :: Int -> Int -> Int -> Int -> Int -> [Char]
calcuTiempo tiempo rojo amarillo verde interm = compararRem (mod tiempo (rojo + amarillo + verde + (3 * interm))) rojo verde amarillo interm

-- ==========================================================
-- FUNCIÓN: compararRem
-- NATURALEZA: Pura
-- ESTRATEGIA: Función condicional mediante guards
-- IMPACTO: No Destructiva
-- ==========================================================
compararRem :: Int -> Int -> Int -> Int -> Int -> String
compararRem resto rojo verde amarillo interm
  | resto < rojo = "en-rojo"
  | resto < (rojo + interm) = "en-rojo-intermitente"
  | resto < (rojo + interm + verde) = "en-verde"
  | resto < (rojo + interm + verde + interm) = "en-verde-intermitente"
  | resto < (rojo + interm + verde + interm + amarillo) = "en-amarillo"
  | resto < (rojo + interm + verde + interm + amarillo + interm) = "en-amarillo-intermitente"
  | otherwise = "error"
