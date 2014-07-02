import Data.List
inputList = [0,0,2,4,0,4,4,8,0,0,2,0,2,0,2,0,2,0,8,8]
data WhatToDo = DoubleIt | ZeroIt | DoNothing deriving (Show, Eq)
compareme x y = 
  if x == y 
    then 1 
  else y
compareme2 x y = 
  if x == 1
    then 3
  else y
isTrue x=
  if x == 1 || x == 3
    then True
  else False
isAction x =
  if x ==1
    then ZeroIt
  else if x == 3
    then DoubleIt
  else DoNothing
action = snd . snd
nr = fst
nr2 = (*2) . (nr)
doAction y = 
  if (DoNothing ==  action y)
    then nr y
  else if (action y == ZeroIt)
    then 0
  else nr2 y
list1 = filter (>0) inputList
func3 =  reverse . (scanl1 compareme2) . reverse . (scanl1 compareme)
list3 = func3 list1
list4 = map (isTrue) list3
list5 = zip list1 (zip list4 $ map (isAction) list3)
func4 = map doAction
list6 = filter (>0) $ func4 list5
def x = 
  if x < 20
    then list6 ++ (replicate (20 - x) 0)
  else list6
list7 = def (length list6)


