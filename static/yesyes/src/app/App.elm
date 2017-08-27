module App exposing (..)

import Tuple exposing (first, second)
import List exposing (map, filter, length)
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick)

import Icon exposing (clickableIconView)
import Board exposing (..)
import Message exposing (..)

main: Program Never Model Message
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = { boardSize: Int, board: Board }

model: Model
model = { boardSize = 8, board = board }

-- UPDATE
update: Message -> Model -> Model
update message model =
  case message of
    Increment ->
      { model | boardSize = model.boardSize + 1 }

    Decrement ->
      { model | boardSize = model.boardSize - 1 }

    Guess coordinates ->
      { model | board = (map (updateBoardPointClicked coordinates) model.board)}

-- VIEW
view: Model -> Html Message
view model =
  div [] 
  [
    div [class "control-panel"] 
    [
      div [class "control-panel-size"]
        [
          clickableIconView "minus" Decrement,
          div [class "input"] [ text (toString model.boardSize) ],
          clickableIconView "plus" Increment
        ]
    ],
    boardView model.board,
    boardHintView (findBoardHintsByHintType Column model.board) "board-hints--column",
    boardHintView (findBoardHintsByHintType Row model.board) "board-hints--row"
  ]