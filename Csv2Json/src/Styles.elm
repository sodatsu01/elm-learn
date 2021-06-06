module Styles exposing (..)

import Css exposing (..)
import Css.Animations
import Css.Transitions
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)

mainContainer = 
  css
    [ displayFlex
    , flexDirection row
    , marginTop (vh 15)
    , property "align-content" "center"
    , justifyContent center
    ]
  

utilContainer =
  css
    [ justifyContent center
    , margin (px 10)
    , width (px 420)
    , height (px 400)
    ]
  
textContainer = 
  css 
    [ displayFlex
    , justifyContent center
    , backgroundColor (rgb 50 50 50)
    , borderRadius (px 15)
    ]

textArea = 
  css
    [ backgroundColor (rgb 0 0 0)
    , color (rgb 255 255 255)
    , height (px 300)
    , width (px 400)
    , margin (px 10)
    , padding (px 15)
    , borderRadius (px 15)
    , outline none
    ]
  
utilButton =
  css
    [ displayFlex
    , width (px 400)
    , margin2 (px 15) (px 10)
    , height (px 30)
    , flexDirection column
    , alignItems center
    , justifyContent center
    ]

convertContainer =
  css 
    [
      displayFlex
    , justifyContent center
    , flexDirection column
    , height (px 400)
    ]

convertButton =
  css 
    [
      width (px 100)
    , height (px 30)
    , margin2 (px 10) (px 0)
    ]

