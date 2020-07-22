{- This module was autogenerated. Please don't edit. -}
module MUI.Core.Toolbar where

import MUI.Core (JSS, class Nub')
import MUI.Core.Styles (Theme, withStyles) as MUI.Core.Styles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)

foreign import data Variant :: Type

variant ::
  { dense :: Variant
  , regular :: Variant
  }
variant = { dense: unsafeCoerce "dense", regular: unsafeCoerce "regular" }

instance eqVariant :: Eq Variant where
  eq = unsafeRefEq

type ToolbarClassesGenericRow a
  = ( dense :: a
    , gutters :: a
    , regular :: a
    , root :: a
    )

type ToolbarClassesKey
  = ToolbarClassesGenericRow String

type ToolbarClassesJSS
  = ToolbarClassesGenericRow JSS

type ToolbarOptPropsRow (r :: #Type)
  = ( children :: Array JSX
    , classes :: { | ToolbarClassesKey }
    , disableGutters :: Boolean
    , variant :: Variant
    | r
    )

type ToolbarReqPropsRow (r :: #Type)
  = r

type ToolbarPropsRow (r :: #Type)
  = ToolbarOptPropsRow (ToolbarReqPropsRow r)

foreign import _UnsafeToolbar :: forall componentProps. ReactComponent { | ToolbarPropsRow componentProps }

_Toolbar ::
  forall given optionalGiven optionalMissing props required.
  Nub' (ToolbarReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (ToolbarPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  ReactComponent { | given }
_Toolbar = unsafeCoerce _UnsafeToolbar

toolbar ::
  forall given optionalGiven optionalMissing props required.
  Nub' (ToolbarReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (ToolbarPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  { | given } -> JSX
toolbar props = element _Toolbar props

toolbarWithStyles ::
  forall jss_ jss given optionalGiven optionalMissing props required.
  Nub' (ToolbarReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (ToolbarPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  Prim.Row.Union jss jss_ ToolbarClassesJSS =>
  (MUI.Core.Styles.Theme -> { | jss }) -> { | given } -> JSX
toolbarWithStyles style props = element (withStyles' style _Toolbar) props
  where
  withStyles' :: (MUI.Core.Styles.Theme -> { | jss }) -> ReactComponent { | given } -> ReactComponent { | given }
  withStyles' = unsafeCoerce MUI.Core.Styles.withStyles

foreign import data ToolbarProps :: Type

toolbarProps ::
  forall given optionalGiven optionalMissing props required.
  Nub' (ToolbarReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (ToolbarPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  { | given } -> ToolbarProps
toolbarProps = unsafeCoerce
