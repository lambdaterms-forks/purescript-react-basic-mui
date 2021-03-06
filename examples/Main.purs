module Examples.Main where

import Prelude

import Data.Array (singleton) as Array
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Exception (throw)
import MUI.Core (jss)
import MUI.Core.AppBar (appBar)
import MUI.Core.AppBar (position) as AppBar
import MUI.Core.Badge (badgeWithStyles)
import MUI.Core.Badge (color) as Badge
import MUI.Core.Button (buttonWithStyles)
import MUI.Core.Button (color) as Button
import MUI.Core.CssBaseline (cssBaseline)
import MUI.Core.FormControl (formControlWithStyles)
import MUI.Core.FormHelperText (formHelperText)
import MUI.Core.Grid (grid)
import MUI.Core.Grid (gridSize) as Grid
import MUI.Core.Input (input)
import MUI.Core.InputLabel (inputLabel)
import MUI.Core.TextField (filledWithStyles, outlinedWithStyles, standardWithStyles) as TextField
import MUI.Core.Toolbar (toolbar)
import MUI.Core.Typography (typography)
import MUI.Core.Typography (variant) as Typography
import MUI.Icons.Menu (menu)
import MUI.Icons.Types (iconWithStyles)
import React.Basic (Component, JSX, createComponent, make)
import React.Basic.DOM (css, div, form, text) as DOM
import React.Basic.DOM (render)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

type Props = {}

component :: Component Props
component = createComponent "Counter"

app :: JSX
app = make component { initialState: {}, render } {}
  where
    textInputStyle theme = { root: jss { width: "80%", margin: theme.spacing 2.0 }}
    render self = DOM.form $ { children: _ }
      [ cssBaseline
      , appBar $ { children: _, position: AppBar.position.static } <<< Array.singleton $
          toolbar $ { children: _ }
            [ iconWithStyles menu (\theme → { root: jss { marginRight: theme.spacing 2.0 }}) {}
            , typography { children: [ DOM.text "News" ], variant: Typography.variant.h6 }
            , buttonWithStyles
                (\theme → { root: jss { marginRight: theme.spacing 2.0 }})
                { children: [ DOM.text "Login" ]
                , color: Button.color.inherit
                }
            ]
      , DOM.div $ { style: DOM.css { "max-width": "960px", margin: "auto" }, children: _ }
          [ badgeWithStyles
              (\theme → { root: jss { margin: theme.spacing 10.0 }})
              { badgeContent: DOM.text "4"
              , children: [ DOM.text "TEST" ]
              , color: Badge.color.primary
              }
          , grid $ { container: true, children: _ }
            [ grid $ { item: true, children: _, xs: Grid.gridSize.six } <<< Array.singleton $
                formControlWithStyles textInputStyle $ { children: _ }
                  [ inputLabel
                    { htmlFor: "m-input"
                    , children: [ DOM.text "Email address" ]
                    }
                  , input { placeholder: "your email address" }
                  , formHelperText { id: "my-helper-text", children: [ DOM.text "We'll never share your email" ]}
                  ]
            , grid $ { item: true, children: _, xs: Grid.gridSize.six } <<< Array.singleton $
                TextField.outlinedWithStyles
                  textInputStyle
                  { error: true
                  , label: inputLabel { children: [ DOM.text "Label" ]}
                  , placeholder: "test"
                  }
            , grid $ { item: true, children: _, xs: Grid.gridSize.six } <<< Array.singleton $
                TextField.standardWithStyles
                  textInputStyle
                  { error: false
                  , label: inputLabel { children: [ DOM.text "Label" ]}
                  , placeholder: "test"
                  }
            , grid $ { item: true, children: _, xs: Grid.gridSize.six } <<< Array.singleton $
                TextField.filledWithStyles
                  textInputStyle
                  { error: true
                  , label: inputLabel { children: [ DOM.text "Label" ]}
                  , placeholder: "test"
                  }
            ]
          ]
      ]


main :: Effect Unit
main = do
  container <- getElementById "container" =<< (map toNonElementParentNode $ document =<< window)
  case container of
    Nothing -> throw "Container element not found."
    Just c  -> render app c

