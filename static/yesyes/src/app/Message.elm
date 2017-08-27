module Message exposing (..)

type Message = Increment | Decrement | Guess (Int, Int)