module Icon exposing (..)

import Html exposing (Html)
import Html.Events exposing (onClick)
import Svg exposing (svg, use)
import Svg.Attributes exposing (class, xlinkHref)

type alias IconName = String

clickableIconView : IconName -> message -> Html message
clickableIconView iconName message = 
    svg [class "icon", onClick message] 
        [use [xlinkHref ("/static/yesyes/dist/icons.svg#" ++ iconName)] []]