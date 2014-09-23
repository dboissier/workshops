-- See this document for more information on making heavy-duck:
-- https://github.com/dboissier/workshops/blob/master/elm/heavy-duck.elm

import Keyboard
import Text

-- Inputs


-- Model
rabbitImg = image 80 100 "http://www.canardpc.com/img/couly/img141.png"

-- Updates



-- Display
bgBlue = rgb 100 220 255
rectWidth  = 320
recHeight = 200

format_direction : (Int, Int) -> String
format_direction (x, y) =
     "KB direction: {" ++ show x ++ ", " ++ show y ++ "}"

display : { x:Int, y:Int } -> Element
display {x, y} = collage rectWidth recHeight [
             filled bgBlue <| rect rectWidth recHeight
           , toForm rabbitImg
           , move (0, 80) <| toForm <| leftAligned <| toText <| format_direction (x, y)
       ]
       
main : Signal Element
main = lift display Keyboard.arrows
