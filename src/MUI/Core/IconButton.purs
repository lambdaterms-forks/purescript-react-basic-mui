{- This module was autogenerated. Please don't edit. -}
module MUI.Core.IconButton where

import MUI.Core (JSS, class Nub')
import MUI.Core.ButtonBase (ButtonBasePropsRow, ButtonBaseReqPropsRow) as MUI.Core.ButtonBase
import MUI.Core.Styles (Theme, withStyles) as MUI.Core.Styles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (Props_button) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)

foreign import data Color :: Type

color ::
  { default :: Color
  , inherit :: Color
  , primary :: Color
  , secondary :: Color
  }
color = { default: unsafeCoerce "default", inherit: unsafeCoerce "inherit", primary: unsafeCoerce "primary", secondary: unsafeCoerce "secondary" }

foreign import data Edge :: Type

edge ::
  { end :: Edge
  , "false" :: Edge
  , start :: Edge
  }
edge = { end: unsafeCoerce "end", "false": unsafeCoerce false, start: unsafeCoerce "start" }

foreign import data Size :: Type

size ::
  { medium :: Size
  , small :: Size
  }
size = { medium: unsafeCoerce "medium", small: unsafeCoerce "small" }

instance eqSize :: Eq Size where
  eq = unsafeRefEq

instance eqEdge :: Eq Edge where
  eq = unsafeRefEq

instance eqColor :: Eq Color where
  eq = unsafeRefEq

type IconButtonClassesGenericRow a
  = ( colorInherit :: a
    , colorPrimary :: a
    , colorSecondary :: a
    , disabled :: a
    , edgeEnd :: a
    , edgeStart :: a
    , label :: a
    , root :: a
    , sizeSmall :: a
    )

type IconButtonClassesKey
  = IconButtonClassesGenericRow String

type IconButtonClassesJSS
  = IconButtonClassesGenericRow JSS

type IconButtonOptPropsRow (r :: #Type)
  = ( children :: Array JSX
    , classes :: { | IconButtonClassesKey }
    , color :: Color
    , disableFocusRipple :: Boolean
    , disableRipple :: Boolean
    , disabled :: Boolean
    , edge :: Edge
    , size :: Size
    | r
    )

type IconButtonReqPropsRow (r :: #Type)
  = r

type IconButtonPropsRow (r :: #Type)
  = IconButtonOptPropsRow (IconButtonReqPropsRow r)

foreign import _UnsafeIconButton :: forall componentProps. ReactComponent { | IconButtonPropsRow componentProps }

_IconButton ::
  forall given optionalGiven optionalMissing props required.
  Nub' (IconButtonReqPropsRow (MUI.Core.ButtonBase.ButtonBaseReqPropsRow ())) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (IconButtonPropsRow (MUI.Core.ButtonBase.ButtonBasePropsRow React.Basic.DOM.Props_button)) props =>
  Prim.Row.Union given optionalMissing props =>
  ReactComponent { | given }
_IconButton = unsafeCoerce _UnsafeIconButton

iconButton ::
  forall given optionalGiven optionalMissing props required.
  Nub' (IconButtonReqPropsRow (MUI.Core.ButtonBase.ButtonBaseReqPropsRow ())) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (IconButtonPropsRow (MUI.Core.ButtonBase.ButtonBasePropsRow React.Basic.DOM.Props_button)) props =>
  Prim.Row.Union given optionalMissing props =>
  { | given } -> JSX
iconButton props = element _IconButton props

iconButtonWithStyles ::
  forall jss_ jss given optionalGiven optionalMissing props required.
  Nub' (IconButtonReqPropsRow (MUI.Core.ButtonBase.ButtonBaseReqPropsRow ())) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (IconButtonPropsRow (MUI.Core.ButtonBase.ButtonBasePropsRow React.Basic.DOM.Props_button)) props =>
  Prim.Row.Union given optionalMissing props =>
  Prim.Row.Union jss jss_ IconButtonClassesJSS =>
  (MUI.Core.Styles.Theme -> { | jss }) -> { | given } -> JSX
iconButtonWithStyles style props = element (withStyles' style _IconButton) props
  where
  withStyles' :: (MUI.Core.Styles.Theme -> { | jss }) -> ReactComponent { | given } -> ReactComponent { | given }
  withStyles' = unsafeCoerce MUI.Core.Styles.withStyles

foreign import data IconButtonProps :: Type

iconButtonProps ::
  forall given optionalGiven optionalMissing props required.
  Nub' (IconButtonReqPropsRow (MUI.Core.ButtonBase.ButtonBaseReqPropsRow ())) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (IconButtonPropsRow (MUI.Core.ButtonBase.ButtonBasePropsRow React.Basic.DOM.Props_button)) props =>
  Prim.Row.Union given optionalMissing props =>
  { | given } -> IconButtonProps
iconButtonProps = unsafeCoerce
