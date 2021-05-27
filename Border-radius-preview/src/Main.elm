module Main exposing (..)


import Browser
import Html exposing (Html, div, input, text, label)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Element.Input as Input


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = 
  { topLeft : Int
  , topRight : Int
  , bottomLeft : Int
  , bottomRight : Int
  }


init : Model
init =
  Model 0 0 0 0  


-- UPDATE


type Msg = 
  Reset 
  | TopLeft String
  | TopRight String
  | BottomLeft String
  | BottomRight String


update : Msg -> Model -> Model
update msg model =
  case msg of
    Reset ->
      Model 0 0 0 0  
    TopLeft input ->
      {model | topLeft = 
      case (String.toInt input) of
        Nothing ->
          0 
        Just integer ->
          integer
      }
    TopRight input ->
      {model | topRight = 
      case (String.toInt input) of
        Nothing ->
          0 
        Just integer ->
          integer
      }
    BottomLeft input ->
      {model | bottomLeft = 
      case (String.toInt input) of
        Nothing ->
          0 
        Just integer ->
          integer
      }
    BottomRight input ->
      {model | bottomRight = 
      case (String.toInt input) of
        Nothing ->
          0 
        Just integer ->
          integer
      }
      

-- VIEW


view : Model -> Html Msg
view model =
  div[] [
    div 
      [ style "width" "200px" 
      , style "height" "200px" 
      , style "margin" "5px" 
      , style "padding" "10px" 
      , style "border" "1px"
      , style "solid" "black"
      , style "background-color" "black"
      , style "border-top-left-radius" (String.fromInt model.topLeft ++ "px")
      , style "border-top-right-radius" (String.fromInt model.topRight ++ "px")
      , style "border-bottom-left-radius" (String.fromInt model.bottomLeft ++ "px")
      , style "border-bottom-right-radius" (String.fromInt model.bottomRight ++ "px")
      ] 
      [ text "" ] 
    , div [][ input [ type_ "text", placeholder "top-left", value (String.fromInt model.topLeft), onInput TopLeft  ][]]
    , div [][ input [ type_ "text", placeholder "top-right", value (String.fromInt model.topRight), onInput TopRight ][]]
    , div [][ input [ type_ "text", placeholder "bottom-left", value (String.fromInt model.bottomLeft), onInput BottomLeft ][]]
    , div [][ input [ type_ "text", placeholder "bottom-right", value (String.fromInt model.bottomRight), onInput BottomRight ][]]
    ]


