module Main exposing (..)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Styles

main = 
  Browser.sandbox 
    { init = init
    , update = update
    , view = view >> toUnstyled }


-- MODEL

type alias Model = 
  { turnOn : Bool
  }

init : Model
init = 
  Model False


-- UPDATE

type Msg = 
  Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Reset ->
      { model | turnOn = False }


-- VIEW

view : Model -> Html Msg
view model = 
  Styles.darkMain [Styles.utilities]
