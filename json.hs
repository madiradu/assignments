{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

import GHC.Generics ( Generic )
import Data.Aeson   ( FromJSON
                    , ToJSON
                    , decode
                    , encode
                    )

import qualified Data.ByteString.Lazy.Char8 as BL

data Struct = Struct { x :: Int, y :: Int, z :: Int, k :: Te } deriving (Generic, Show)
data Te = Te {z::Int} deriving (Generic, Show)
instance FromJSON Struct
instance ToJSON Struct
instance ToJSON Te
instance FromJSON Te
decodeJSONToStruct :: BL.ByteString -> Maybe Struct
decodeJSONToStruct stringValue = decode stringValue

main :: IO ()
main = do
  -- parsing a JSON-formatted string into a well-typed data structure
  input1 <- BL.readFile "date.json"
  print . decodeJSONToStruct $ input1
  -- converting a well-typed data structure into a JSON-formatted string
 -- BL.putStrLn $ encode $ Struct 142 2.71 (Te 2)
