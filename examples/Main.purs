module Examples.Main where

import Prelude

import Data.Array (elem, singleton) as Array
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Exception (throw)
import Foreign (unsafeToForeign)
import MUI.Core (jss)
import MUI.Core.AppBar (appBar)
import MUI.Core.AppBar (position) as AppBar
import MUI.Core.Backdrop (_UnsafeBackdrop)
import MUI.Core.Badge (badgeWithStyles)
import MUI.Core.Badge (color) as Badge
import MUI.Core.Box (box)
import MUI.Core.Button (button, buttonWithStyles)
import MUI.Core.Button (button, color) as Button
import MUI.Core.ButtonGroup (buttonGroupWithStyles, color, variant) as ButtonGroup
import MUI.Core.Container (container)
import MUI.Core.CssBaseline (cssBaseline)
import MUI.Core.Divider (divider, dividerWithStyles)
import MUI.Core.Divider (variant) as Dividier
import MUI.Core.Drawer (anchor) as Drawer
import MUI.Core.Drawer (drawer)
import MUI.Core.Fade (fade)
import MUI.Core.FormControl (formControlWithStyles)
import MUI.Core.FormHelperText (formHelperText)
import MUI.Core.Grid (grid)
import MUI.Core.Grid (gridSize) as Grid
import MUI.Core.Hidden (hidden)
import MUI.Core.Hidden (implementation, only) as Hidden
import MUI.Core.Input (input)
import MUI.Core.InputLabel (inputLabel)
import MUI.Core.Link (color) as Link
import MUI.Core.Link (link)
import MUI.Core.List (list)
import MUI.Core.ListItem (listItem)
import MUI.Core.ListItemIcon (listItemIcon)
import MUI.Core.ListItemText (listItemText)
import MUI.Core.Modal (modal)
import MUI.Core.Styles.MakeStyles (makeStyles)
import MUI.Core.Styles.Types (multiplier, spacing)
import MUI.Core.TextField (filledWithStyles, outlinedWithStyles, standardWithStyles) as TextField
import MUI.Core.Toolbar (toolbar)
import MUI.Core.Typography (typography)
import MUI.Core.Typography (variant) as Typography
import MUI.Icons.Inbox (inbox)
import MUI.Icons.Mail (mail)
import MUI.Icons.Menu (menu)
import MUI.Icons.Types (icon, iconWithStyles)
import MUI.React.TransitionGroup (single) as TransitionGroup
import MUI.System.Display (flex, none) as Only
import MUI.System.Display (hiding)
import MUI.System.Flexbox (flexEnd) as Flexbox
import MUI.System.Flexbox.JustifyContent (flexEnd) as JustifyContent
import React.Basic (Component, JSX, ReactComponent, createComponent, element, make)
import React.Basic.DOM (a, button, div, div_, form, h2, p, span, text) as DOM
import React.Basic.DOM (render)
import React.Basic.Events (handler_)
import React.Basic.Hooks (useState)
import React.Basic.Hooks as React
import Unsafe.Coerce (unsafeCoerce)
import Untagged.Union (asOneOf)
import Web.DOM.NonElementParentNode (getElementById)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toNonElementParentNode)
import Web.HTML.Window (document)

type Props = {}

component :: Component Props
component = createComponent "Counter"

gridItem :: JSX -> JSX
gridItem child = grid { item: true, children: [ child ], xs: Grid.gridSize.six }

arr :: forall a. a -> Array a
arr = Array.singleton

-- | Based on: https://github.com/mui-org/material-ui/blob/master/docs/src/pages/components/drawers/TemporaryDrawer.js
drawerList :: Effect (ReactComponent {})
drawerList =
  let
    useStyles = makeStyles \theme ->
      { paper:
          { backgroundColor: theme.palette.background.paper
          , padding: spacing
              (multiplier 2.0)
              (multiplier 4.0)
              (multiplier 3.0)
              (multiplier 4.0)
              theme
          }
      , list: { width: 250 }
      , fullList: { width: "auto" }
      }

    menuList classes anchor = DOM.div
      $ { className: if anchor `Array.elem` [ Drawer.anchor.bottom, Drawer.anchor.top ]
          then classes.fullList
          else classes.list
        , children: _
        , role: "presentation"
        }
      $ arr <<< list $ { children: _ }
        $ ( [ "Inbox", "Starred", "Send emai", "Drafts" ] <#> \text ->
              listItem $ { button: true, children: _ }
                [ listItemIcon { children: [ icon (if text == "Inbox" then inbox else mail) {} ]}
                , listItemText { primary: DOM.text text }
                ]
          )
        <> [ divider {} ]
        <>( ["All mail", "Trash", "Spam"] <#> \text ->
              listItem $ { button: true, children: _ }
                [ listItemIcon { children: [ icon (if text == "Inbox" then inbox else mail) {} ]}
                , listItemText { primary: DOM.text text }
                ]
          )
  in
    React.component "TemporaryDrawer" \_ -> React.do
      state /\ setState <- useState Nothing
      classes <- useStyles
      let
        toggleDrawer a open =
          -- In the original example we have here also this check
          -- if (event.type === 'keydown' && (event.key === 'Tab' || event.key === 'Shift')) {
          --    return;
          --  }
          let
            toggle Nothing = Just a
            toggle s | s == Just a = Nothing
            toggle s = s
          in
            setState toggle
      pure $ DOM.div_ $ [ Drawer.anchor.left, Drawer.anchor.right,  Drawer.anchor.top,  Drawer.anchor.bottom ] <#> \anchor ->
        DOM.div $ { key: unsafeCoerce anchor, children: _ }
          [ button
              { onClick: handler_ (toggleDrawer anchor true)
              , children: [ DOM.text (unsafeCoerce anchor ) ]
              }
          , drawer
            $ { anchor
              , open: Just anchor == state
              , onClose: handler_ (toggleDrawer anchor false)
              , children: _
              }
            $ [ menuList classes anchor ]
          ]

-- | MUI example: https://github.com/mui-org/material-ui/blob/master/docs/src/pages/components/modal/TransitionsModal.js
transitionsModal :: Effect (ReactComponent {})
transitionsModal =
  let
    useStyles = makeStyles \theme ->
      { modal:
        { display: "flex"
        , alignItems: "center"
        , justifyContent: "center"
        }
      , paper:
        { backgroundColor: theme.palette.background.paper
        , border: "2px solid #000"
        , boxShadow: theme.shadows."24"
        , padding: spacing
            (multiplier 2.0)
            (multiplier 4.0)
            (multiplier 3.0)
            (multiplier 4.0)
            theme
        }
      }
  in React.component "TransitionsModal" \_ -> React.do
    open /\ setOpen <- useState false
    classes <- useStyles
    let
      handleOpen = handler_ $ setOpen (const true)
      handleClose = handler_ $ setOpen (const false)
    pure $ DOM.div_
      [ DOM.button $
        { children: [ DOM.text "Modal: react-transition-group" ]
        , type: "button"
        , onClick: handleOpen
        }
      , modal
        $ {"BackdropProps":
              unsafeToForeign { transitionDuration: TransitionGroup.single 500.0 }
          , "BackdropComponent":
              unsafeToForeign _UnsafeBackdrop
          , children: _
          , className: classes.modal
          , closeAfterTransition: true
          , open
          , onClose: handleClose
          }
        $ fade
          $ { in: open
            , children: _
            , timeout: TransitionGroup.single 1000.0
            }
          $ DOM.div
            $ { className: classes.paper, children: _ }
            $ [ DOM.h2 { id: "transition-modal-title", children: [ DOM.text "Transition modal" ]}
              , DOM.p { id: "transition-modal-description", children: [ DOM.text "react-transition-group animates me" ]}
              ]
      ]

type Components =
  { drawerList :: ReactComponent {}
  , transitionsModal :: ReactComponent {}
  }

app :: Components -> JSX
app components = make component { initialState: {}, render } {}
  where
    textInputStyle theme = { root: jss { width: "80%", margin: theme.spacing 2.0 }}
    render self = DOM.div $ { children: _ }
      [ cssBaseline
      , appBar $ { children: _, position: AppBar.position.static } <<< Array.singleton $
          toolbar $ { children: _ } $
            [ iconWithStyles menu (\theme -> { root: jss { marginRight: theme.spacing 2.0 }}) {}
            , typography $ { children: _, variant: Typography.variant.h6 } <<< Array.singleton $
               link { children: [ DOM.text "LINK" ], href: "#TEST", color: Link.color.inherit }
            , buttonWithStyles
                (\theme -> { root: jss { marginRight: theme.spacing 2.0 }})
                { children: [ DOM.text "Login" ]
                , color: Button.color.inherit
                }
            , hidden
              { implementation: Hidden.implementation.css
              , children: [ DOM.text "`Hidden` visible on sm, lg, xl " ]
              , only: Hidden.only.only [ Hidden.only.xs, Hidden.only.md ]
              }
            , box $
              { children:
                [ DOM.text "`Box` visible on md and larger justify-content: flex-end" ]
              , display: hiding { xs: Only.none, sm: Only.none, md: Only.flex }
              , flexGrow: 1.0
              , justifyContent: asOneOf Flexbox.flexEnd
              }
            ]
      , container $ { fixed: true, children: _ }
          [ DOM.form $ { children: _ } $
            [ grid $ { container: true, children: _ }
              [ gridItem $
                  formControlWithStyles textInputStyle $ { children: _ }
                    [ inputLabel
                      { htmlFor: "m-input"
                      , children: [ DOM.text "Email address" ]
                      }
                    , input { placeholder: "your email address" }
                    , formHelperText { id: "my-helper-text", children: [ DOM.text "We'll never share your email" ]}
                    ]
              , gridItem $
                  TextField.outlinedWithStyles
                    textInputStyle
                    { error: true
                    , helperText: DOM.span $ { children: _ }
                      [ DOM.text "A link inside a helper text: "
                      , DOM.a { href: "https://example.com", children: [ DOM.text "example.com" ]}
                      ]
                      -- { dangerouslySetInnerHTML: { __html : "<a href=\"https://google.com\">UNSAFE</a>" }}
                    , label: inputLabel { children: [ DOM.text "Label" ]}
                    , placeholder: "test"
                    }
              , gridItem $ element components.transitionsModal {}
              , gridItem $ element components.drawerList {}
              , gridItem $
                  TextField.standardWithStyles
                    textInputStyle
                    { error: false
                    , label: inputLabel { children: [ DOM.text "Label" ]}
                    , placeholder: "test"
                    }
              , gridItem $
                  TextField.filledWithStyles
                    textInputStyle
                    { error: true
                    , label: inputLabel { children: [ DOM.text "Label" ]}
                    , placeholder: "test"
                    }
              ]
          ]
          , dividerWithStyles
              (\theme -> { root: jss { marginTop: theme.spacing 4.0, marginBottom: theme.spacing 4.0 }})
              { variant: Dividier.variant.middle }
          , grid $ { container: true, children: _ }
            [ gridItem $
                ButtonGroup.buttonGroupWithStyles (\theme -> { root: jss { margin: theme.spacing 2.0 }}) $
                  { variant: ButtonGroup.variant.text, color: ButtonGroup.color.primary, children: _ }
                  [ Button.button { children: [ DOM.text "One" ]}
                  , Button.button { children: [ DOM.text "Two" ]}
                  , Button.button { children: [ DOM.text "Three" ]}
                  ]
            , gridItem $ badgeWithStyles
                (\theme -> { root: jss { margin: theme.spacing 2.0 }})
                { badgeContent: DOM.text "4"
                , children: [ DOM.text "Badge example" ]
                , color: Badge.color.secondary
                }
            ]
          ]
      ]


main :: Effect Unit
main = do
  container <- getElementById "container" =<< (map toNonElementParentNode $ document =<< window)
  components <- { drawerList: _, transitionsModal: _ } <$> drawerList <*> transitionsModal
  case container of
    Nothing -> throw "Container element not found."
    Just c  -> render (app components) c

