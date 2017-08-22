module App exposing (..)

import Tuple exposing (first, second)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Icon exposing (clickableIcon)

main: Program Never Model Message
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias BoardPoint = { x: Int, y: Int, isPoint: Bool, isClicked: Bool }
type alias Board = List BoardPoint
type alias Model = { boardSize: Int, board: Board }

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

model: Model
model = { boardSize = 8, board = board }

-- UPDATE
type Message = Increment | Decrement | Guess (Int, Int)

update: Message -> Model -> Model
update message model =
  case message of
    Increment ->
      { model | boardSize = model.boardSize + 1 }

    Decrement ->
      { model | boardSize = model.boardSize - 1 }

    Guess coordinates ->
      { model | board = (List.map (updateBoardPointClicked coordinates) model.board)}

updateBoardPointClicked: (Int, Int) -> BoardPoint -> BoardPoint
updateBoardPointClicked coordinates boardPoint =
  if first coordinates == boardPoint.x && second coordinates == boardPoint.y then
    { boardPoint | isClicked = True }
  else
    boardPoint

-- VIEW
view: Model -> Html Message
view model =
  div [] 
  [
    div [class "control-panel"] 
    [
      div [class "control-panel-size"]
        [
          clickableIcon "minus" Decrement,
          div [class "input"] [ text (toString model.boardSize) ],
          clickableIcon "plus" Increment
        ]
    ],
    boardView model.board
  ]

boardView: Board -> Html Message
boardView board =
  div [class "board"] (List.map boardPointView board)

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