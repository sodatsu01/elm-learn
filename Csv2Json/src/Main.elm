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
  { csv : String
  , json : String
  }

init : Model
init = 
  Model "1" "2"


-- UPDATE

type Msg = 
  ToJson

update : Msg -> Model -> Model
update msg model =
  case msg of
    ToJson ->
      { model | csv = "" }

-- VIEW

view : Model -> Html Msg
view model = 
    div [ Styles.mainContainer ] -- container
      [ div [ Styles.utilContainer ]  -- left side
        [ div [ Styles.textContainer ]
          [ textarea [ Styles.textArea ] [ text "" ] 
          ]
        , div []
          [ button [ Styles.utilButton ][text "upload text file"]
          ]
        ]
      , div [ Styles.convertContainer] -- center
        [ button [Styles.convertButton] []
        , button [Styles.convertButton] []
        ]
      , div [ Styles.utilContainer ] -- right side
        [ div [ Styles.textContainer ]
          [ textarea [ Styles.textArea , Attrs.readonly True ] [ text "" ] 
          ]
        ]
      ]
