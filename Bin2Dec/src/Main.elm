module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text, input)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = 
  { binary : String
  }


init : Model
init =
  Model ""


-- UPDATE


type Msg = 
  Reset 
  | Binary String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Reset ->
      { model | binary = "" }
    Binary bin ->
      { model | binary = bin }


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "binary", value model.binary, onInput Binary][]
    , button [ onClick Reset ][ text "Reset" ]
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model = 
  if (String.length model.binary) > 8 then
    div [style "color" "red" ] [ text "Input is too long. It must be 8 or shorter"]
  else
    text ""
