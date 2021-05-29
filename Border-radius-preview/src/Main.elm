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
  div[ style "width" "650px"
     , style "margin" "50px"
     , style "position" "relative"
     ] [
    div [ class "input-top-left"
        , style "display" "inline"
        , style "width" "50px"
        , style "padding-right" "250px"
        , style "top" "-2px"
        , style "left" "-115px"
        , style "text-align" "left"
        ][ input [ style "width" "25px"
                 , type_ "text"
                 , placeholder "top-left"
                 , value (String.fromInt model.topLeft)
                 , onInput TopLeft ][]]
    , div [ class "input-top-right"
          , style "display" "inline"
          , style "width" "50px"
          , style "padding-left" "250px"
          , style "top" "-2px"
          , style "right" "-115px"
          , style "text-align" "right"
          ][ input [ style "width" "25px"
           , type_ "text"
           , placeholder "top-right"
           , value (String.fromInt model.topRight)
           , onInput TopRight ][]]
    , div [ style "width" "500px" 
          , style "height" "200px" 
          , style "margin" "5px" 
          , style "padding" "10px" 
          , style "border" "2px"
          , style "solid" "black"
          , style "background-color" "#e9eaee"
          , style "text-align" "center"
          , style "border-top-left-radius" (String.fromInt model.topLeft ++ "px")
          , style "border-top-right-radius" (String.fromInt model.topRight ++ "px")
          , style "border-bottom-left-radius" (String.fromInt model.bottomLeft ++ "px")
          , style "border-bottom-right-radius" (String.fromInt model.bottomRight ++ "px")
          ] [ div[] [text ("border-top-left-radius: " ++ (String.fromInt model.topLeft) ++"px")]
            , div[] [text ("border-top-right-radius: " ++ (String.fromInt model.topRight) ++"px")]
            , div[] [text ("border-bottom-left-radius: " ++ (String.fromInt model.bottomLeft) ++"px")]
            , div[] [text ("border-bottom-right-radius: " ++ (String.fromInt model.bottomRight) ++"px")]
          ]
    , div [ class "input-bottom-left" 
          , style "display" "inline"
          , style "width" "50px"
          , style "padding-right" "250px"
          , style "bottom" "-2px"
          , style "left" "-115px"
          , style "text-align" "left"
          ][ input [ style "width" "25px" 
           , type_ "text"
           , placeholder "bottom-left"
           , value (String.fromInt model.bottomLeft)
           , onInput BottomLeft ][]]
    , div [ class "input-bottom-right"
          , style "display" "inline"
          , style "width" "50px"
          , style "padding-left" "250px"
          , style "bottom" "-2px"
          , style "right" "-115px"
          , style "text-align" "right"
          ][ input [ style "width" "25px"
           , type_ "text"
           , placeholder "bottom-right"
           , value (String.fromInt model.bottomRight)
           , onInput BottomRight ][]]
    ]
