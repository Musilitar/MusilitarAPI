module Board exposing (..)

import List exposing (length, filter, map)
import Tuple exposing (first, second)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)

import Message exposing (..)

-- MODEL
type alias BoardPoint = { x: Int, y: Int, isPoint: Bool, isClicked: Bool }
type alias Board = List BoardPoint

type BoardHint = Column | Row

board: Board
board = 
  [
    { x = 0, y = 0, isPoint = False, isClicked = False },
    { x = 1, y = 0, isPoint = False, isClicked = False },
    { x = 2, y = 0, isPoint = False, isClicked = False },
    { x = 3, y = 0, isPoint = False, isClicked = False },
    { x = 4, y = 0, isPoint = False, isClicked = False },
    { x = 5, y = 0, isPoint = False, isClicked = False },
    { x = 6, y = 0, isPoint = False, isClicked = False },
    { x = 7, y = 0, isPoint = False, isClicked = False },
    { x = 0, y = 1, isPoint = False, isClicked = False },
    { x = 1, y = 1, isPoint = False, isClicked = False },
    { x = 2, y = 1, isPoint = False, isClicked = False },
    { x = 3, y = 1, isPoint = False, isClicked = False },
    { x = 4, y = 1, isPoint = True, isClicked = False },
    { x = 5, y = 1, isPoint = False, isClicked = False },
    { x = 6, y = 1, isPoint = False, isClicked = False },
    { x = 7, y = 1, isPoint = False, isClicked = False },
    { x = 0, y = 2, isPoint = False, isClicked = False },
    { x = 1, y = 2, isPoint = False, isClicked = False },
    { x = 2, y = 2, isPoint = False, isClicked = False },
    { x = 3, y = 2, isPoint = True, isClicked = False },
    { x = 4, y = 2, isPoint = False, isClicked = False },
    { x = 5, y = 2, isPoint = True, isClicked = False },
    { x = 6, y = 2, isPoint = False, isClicked = False },
    { x = 7, y = 2, isPoint = False, isClicked = False },
    { x = 0, y = 3, isPoint = False, isClicked = False },
    { x = 1, y = 3, isPoint = False, isClicked = False },
    { x = 2, y = 3, isPoint = True, isClicked = False },
    { x = 3, y = 3, isPoint = True, isClicked = False },
    { x = 4, y = 3, isPoint = False, isClicked = False },
    { x = 5, y = 3, isPoint = True, isClicked = False },
    { x = 6, y = 3, isPoint = True, isClicked = False },
    { x = 7, y = 3, isPoint = False, isClicked = False },
    { x = 0, y = 4, isPoint = False, isClicked = False },
    { x = 1, y = 4, isPoint = False, isClicked = False },
    { x = 2, y = 4, isPoint = True, isClicked = False },
    { x = 3, y = 4, isPoint = False, isClicked = False },
    { x = 4, y = 4, isPoint = True, isClicked = False },
    { x = 5, y = 4, isPoint = False, isClicked = False },
    { x = 6, y = 4, isPoint = True, isClicked = False },
    { x = 7, y = 4, isPoint = False, isClicked = False },
    { x = 0, y = 5, isPoint = False, isClicked = False },
    { x = 1, y = 5, isPoint = False, isClicked = False },
    { x = 2, y = 5, isPoint = True, isClicked = False },
    { x = 3, y = 5, isPoint = True, isClicked = False },
    { x = 4, y = 5, isPoint = False, isClicked = False },
    { x = 5, y = 5, isPoint = True, isClicked = False },
    { x = 6, y = 5, isPoint = True, isClicked = False },
    { x = 7, y = 5, isPoint = False, isClicked = False },
    { x = 0, y = 6, isPoint = False, isClicked = False },
    { x = 1, y = 6, isPoint = False, isClicked = False },
    { x = 2, y = 6, isPoint = True, isClicked = False },
    { x = 3, y = 6, isPoint = True, isClicked = False },
    { x = 4, y = 6, isPoint = True, isClicked = False },
    { x = 5, y = 6, isPoint = True, isClicked = False },
    { x = 6, y = 6, isPoint = True, isClicked = False },
    { x = 7, y = 6, isPoint = False, isClicked = False },
    { x = 0, y = 7, isPoint = False, isClicked = False },
    { x = 1, y = 7, isPoint = False, isClicked = False },
    { x = 2, y = 7, isPoint = False, isClicked = False },
    { x = 3, y = 7, isPoint = False, isClicked = False },
    { x = 4, y = 7, isPoint = False, isClicked = False },
    { x = 5, y = 7, isPoint = False, isClicked = False },
    { x = 6, y = 7, isPoint = False, isClicked = False },
    { x = 7, y = 7, isPoint = False, isClicked = False }
  ]

determineBoardSize: Board -> Int
determineBoardSize board = 
  board
    |> length
    |> toFloat
    |> sqrt
    |> round

isNthRow: Int -> BoardPoint -> Bool
isNthRow n boardPoint =
  n == boardPoint.y

isNthColumn: Int -> BoardPoint -> Bool
isNthColumn n boardPoint =
  n == boardPoint.x

boardPointsByRowNumber: Board -> Int -> List BoardPoint
boardPointsByRowNumber board rowNumber  =
  filter (isNthRow rowNumber) board

boardPointsByColumnNumber: Board -> Int -> List BoardPoint
boardPointsByColumnNumber board columnNumber =
  filter (isNthColumn columnNumber) board

boardPointsToBoardHint: List BoardPoint -> Int
boardPointsToBoardHint boardPoints =
  length (filter (\n -> n.isPoint == True) boardPoints)

findBoardHintsByHintType: BoardHint -> Board -> List Int
findBoardHintsByHintType hintType board = 
  let
    boardSize = determineBoardSize board
  in
    case hintType of
      Column ->
        map (boardPointsByColumnNumber board) (List.range 0 (boardSize - 1))
          |> map boardPointsToBoardHint
      Row ->
        map (boardPointsByRowNumber board) (List.range 0 (boardSize - 1))
          |> map boardPointsToBoardHint

-- UPDATE
updateBoardPointClicked: (Int, Int) -> BoardPoint -> BoardPoint
updateBoardPointClicked coordinates boardPoint =
  if first coordinates == boardPoint.x && second coordinates == boardPoint.y then
    { boardPoint | isClicked = True }
  else
    boardPoint

-- VIEW
boardView: Board -> Html Message
boardView board =
  div [class "board"] (map boardPointView board)

boardPointView: BoardPoint -> Html Message
boardPointView boardPoint = 
  div 
  [
    classList 
    [
      ("board-point", True),
      ("board-point--pristine", not boardPoint.isClicked),
      ("board-point--correct", boardPoint.isClicked && boardPoint.isPoint),
      ("board-point--incorrect", boardPoint.isClicked && not boardPoint.isPoint)
    ],
    onClick (Guess (boardPoint.x, boardPoint.y))
  ] 
  [text ((toString boardPoint.x) ++ ", " ++ (toString boardPoint.y))]

boardHintView: List Int -> String -> Html Message
boardHintView boardHints className =
  div [classList [("board-hints", True), (className, True)]] (map hintView (map (\n -> toString n) boardHints))

hintView: String -> Html Message
hintView hint =
  div [class "board-hint"] [text hint]