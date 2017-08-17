module App exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

import Icon exposing (icon)

main : Program Never Model Message
main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model = 
  { boardSize : Int }

model : Model
model =
  { boardSize = 8 }

-- UPDATE
type Message = Increment | Decrement

update : Message -> Model -> Model
update message model =
  case message of
    Increment ->
      { model | boardSize = model.boardSize + 1 }

    Decrement ->
      { model | boardSize = model.boardSize - 1 }

-- VIEW
view : Model -> Html Message
view model =
  div []
    [
      icon "minus" Decrement,
      div [] [ text (toString model.boardSize) ],
      icon "plus" Increment
    ]