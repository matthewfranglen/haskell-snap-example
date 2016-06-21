module Main where

import           Snap.Core
import           Snap.Http.Server
import           Data.ByteString.Char8 as B

main = quickHttpServe $ writeBS $ B.pack $ show (fibonacci 40)

fibonacci n
    | n < 2     = 1
    | otherwise = fibonacci (n-2) + fibonacci (n-1)
