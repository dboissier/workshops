import Keyboard

-- Inputs
delta = inSeconds <~ fps 30


-- Model
rabbitImg = image 80 100 "http://www.canardpc.com/img/couly/img141.png"

-- Updates



-- Display
bgBlue = rgb 100 220 255
rectWidth  = 800
recHeight = 600

main : Element
main = collage rectWidth recHeight [
             filled bgBlue <| rect rectWidth recHeight
           , toForm rabbitImg
       ]
