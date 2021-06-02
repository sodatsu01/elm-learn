module Main exposing (..)

import Browser
import Css exposing (..)
import Html
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attrs
import Styles
import Html.Styled.Events exposing (onClick, onInput)

main = 
  Browser.sandbox 
    { init = init
    , update = update
    , view = view >> toUnstyled }


-- MODEL

type alias Model = 
  { turnOn : Bool
  , speed : String
  }

init : Model
init = 
  Model True "1"


-- UPDATE

type Msg = 
  Off
  | On
  | ChangeSpeed String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Off ->
      { model | turnOn = False }
    On ->
      { model | turnOn = True }
    ChangeSpeed speed -> 
      { model | speed = speed }


-- VIEW

view : Model -> Html Msg
view model = 
  Styles.darkMain 
    [ Styles.mainArea (viewCircles model)
    , div [ Styles.utilitiesStyle ] 
      [ div [][ Styles.title ]
      , div []
        [ button [ Styles.btnStyle, onClick On ][ text "On"]
        , button [ Styles.btnStyle , onClick Off ][ text "Off"]
        , label [ Styles.labelStyle ]
          [ 
            text "Speed: "
            , input
            [ Attrs.type_ "number"
            , Attrs.max "5"
            , Attrs.min "1"
            , Attrs.value model.speed
            , onInput ChangeSpeed
            , Styles.inputStyle
            ] []
          ]
        ]
      ]
    ]

viewCircles : Model -> List (Html msg)
viewCircles model =
  let 
    floatSpeed = 
      case (String.toFloat model.speed) of
        Nothing ->
          1
        Just speed ->
          speed
  in
  case model.turnOn of
    True -> 
      [ div [ Styles.onCircle1 Styles.redString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle2 Styles.yellowString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle1 Styles.blueString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle2 Styles.greenString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle1 Styles.redString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle2 Styles.yellowString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle1 Styles.blueString floatSpeed, Styles.circleStyle][]
      , div [ Styles.onCircle2 Styles.greenString floatSpeed, Styles.circleStyle][]
      ]
    False ->
      [ div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      , div [ Styles.offCircle, Styles.circleStyle][]
      ]
