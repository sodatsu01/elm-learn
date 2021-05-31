module Styles exposing (..)

import Css exposing (..)
import Css.Animations
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

mainArea list = 
  div 
    [ css
      [ borderRadius (px 25)
      , height (vh 20)
      , width (vw 100)
      , displayFlex
      , justifyContent center
      , alignItems center
      ]
    ] list

circleStyle =
 css
  [ displayFlex
  , margin (rem 1)
  , borderRadius (pct 50)
  , height (px 50)
  , width (px 50)
  -- , backgroundColor (rgba 68 53 73 0.3)
  , position relative
  , before 
    [ position absolute
    , height (px 15)
    , width (px 15)
    , left (px 17.5)
    , top (px -15)
    , margin (px 0)
    , padding (px 0)
    , display inlineBlock
    , backgroundColor (rgb 68 53 73)
    , borderRadius (px 2)
    , borderBottom3 (px 2) solid (rgb 97 81 107)
    , property "content" "''"
    ]
  , after
    [ position absolute
    , top (px -20)
    , left (px 30)
    , width (px 70)
    , height (px 18.6666666667)
    , borderBottom3 (px 2) solid (hex "#222")
    , borderRadius (pct 50)
    , property "content" "''"
    , lastChild [ border (px 0)]
    ]
  ]

circle =
  div 
    [ css
      [ displayFlex
      , margin (rem 1)
      , borderRadius (pct 50)
      , height (px 50)
      , width (px 50)
      , backgroundColor (rgba 68 53 73 0.3)
      , position relative
      , before 
        [ position absolute
        , height (px 15)
        , width (px 15)
        , left (px 17.5)
        , top (px -15)
        , margin (px 0)
        , padding (px 0)
        , display inlineBlock
        , backgroundColor (rgb 68 53 73)
        , borderRadius (px 2)
        , borderBottom3 (px 2) solid (rgb 97 81 107)
        , property "content" "''"
        ]
      , after
        [ position absolute
        , top (px -20)
        , left (px 30)
        , width (px 70)
        , height (px 18.6666666667)
        , borderBottom3 (px 2) solid (hex "#222")
        , borderRadius (pct 50)
        , property "content" "''"
        , lastChild [ border (px 0)]
        ]
      ]
    ][]

glow1 color = 
  Css.Animations.keyframes
    [ 
      (100, [Css.Animations.property "box-shadow" ("0 0 20px 5px " ++ color)])
    , (0, [Css.Animations.property "box-shadow" ("0 0 20px 5px " ++ color)])
    , (50 , [Css.Animations.property "box-shadow" "none"])
    ]

glow2 color = 
  Css.Animations.keyframes
    [ 
      (50, [Css.Animations.property "box-shadow" ("0 0 20px 5px " ++ color)])
    , (0 , [Css.Animations.property "box-shadow" "none"])
    , (100 , [Css.Animations.property "box-shadow" "none"])
    ]

offCircle = css [ backgroundColor (rgba 0 0 0 0.3)]

onCircle1 color = css [backgroundColor (hex color)
          , animationName (glow1 color)
          , animationDuration (sec 1)
          , property "animation-iteration-count" "infinite"
          ]

onCircle2 color = css [backgroundColor (hex color)
          , animationName (glow2 color)
          , animationDuration (sec 1)
          , property "animation-iteration-count" "infinite"
          ]

redString = "#c03925"
yellowString = "#f1c40f"
blueString = "#64fcfe"
greenString = "#2ecc71"
