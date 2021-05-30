module Styles exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)

-- darkMain : Html msg
darkMain h = 
  div
    [ css
      [ displayFlex
      , flexDirection column
      , backgroundColor (rgb 0 0 40)
      , minHeight (vh 100)
      , margin (px 0)
      , overflow hidden
      ]
    ] h

utilities = 
  div
    [ css
      [ width (vw 100)
      , padding (rem 1)
      , color (rgb 255 255 255)
      , position absolute
      , top (pct 50)
      , left (pct 50)
      , fontFamilies ["Lato", "sans-serif"]
      , transform (translate2(pct -50) (pct -50))
      , margin (rem 1)
      , displayFlex
      , flexDirection column
      , justifyContent center
      , alignItems center
      ]
    ][ div[][ title]
     , div[][ btn "On", btn "Off"]
     ]

title = 
  h1 
    [ css
      [ fontFamilies ["Cinezl", "sans-serif"]
      , letterSpacing (px 2)
      , fontSize (rem 2)
      , textAlign center
      , textShadow4 (px 0) (px 0) (px 30) (rgb 255 0 0)
      ]
    ] [ text "Christmas Lights"]

btn str = 
  button
    [ css
      [ height (px 50)
      , width (px 50)
      , backgroundColor (rgb 0 0 40)
      , color (rgb 255 255 255)
      , border3 (px 2) solid (rgb 184 134 222)
      , borderRadius (px 25)
      , margin2 (px 0) (px 12)
      , outline none
      ]
    ][text str]
