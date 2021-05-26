module Main exposing (..)


import Browser
import Binary
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
  else if (String.any isNotDigit model.binary) then
    div [style "color" "red" ] [ text "Input must contain only 0 or 1 and must not contain other character"]
  else
    div [style "color" "green" ] [ text (binToDec model.binary) ]


isNotDigit : Char -> Bool
isNotDigit char = 
  char /= '1' && char /= '0'

binToDec : String -> String
binToDec bin =
  String.reverse bin
  |> String.indexes "1"
  |> List.map square
  |> List.sum
  |> String.fromInt

square : Int -> Int
square i =
  2 ^ i

