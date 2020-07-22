{- This module was autogenerated. Please don't edit. -}
module MUI.Core.Hidden where

import MUI.Core (class Nub')
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (Props_div) as React.Basic.DOM
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)

foreign import data Implementation :: Type

implementation ::
  { css :: Implementation
  , js :: Implementation
  }
implementation = { css: unsafeCoerce "css", js: unsafeCoerce "js" }

foreign import data InitialWidth :: Type

initialWidth ::
  { lg :: InitialWidth
  , md :: InitialWidth
  , sm :: InitialWidth
  , xl :: InitialWidth
  , xs :: InitialWidth
  }
initialWidth = { lg: unsafeCoerce "lg", md: unsafeCoerce "md", sm: unsafeCoerce "sm", xl: unsafeCoerce "xl", xs: unsafeCoerce "xs" }

foreign import data Only :: Type

only ::
  { lg :: Only
  , md :: Only
  , only :: Array Only -> Only
  , sm :: Only
  , xl :: Only
  , xs :: Only
  }
only = { lg: unsafeCoerce "lg", md: unsafeCoerce "md", only: unsafeCoerce, sm: unsafeCoerce "sm", xl: unsafeCoerce "xl", xs: unsafeCoerce "xs" }

instance eqInitialWidth :: Eq InitialWidth where
  eq = unsafeRefEq

instance eqImplementation :: Eq Implementation where
  eq = unsafeRefEq

type HiddenOptPropsRow (r :: #Type)
  = ( implementation :: Implementation
    , initialWidth :: InitialWidth
    , lgDown :: Boolean
    , lgUp :: Boolean
    , mdDown :: Boolean
    , mdUp :: Boolean
    , only :: Only
    , smDown :: Boolean
    , smUp :: Boolean
    , xlDown :: Boolean
    , xlUp :: Boolean
    , xsDown :: Boolean
    , xsUp :: Boolean
    | r
    )

type HiddenReqPropsRow (r :: #Type)
  = r

type HiddenPropsRow (r :: #Type)
  = HiddenOptPropsRow (HiddenReqPropsRow r)

foreign import _UnsafeHidden :: forall componentProps. ReactComponent { | HiddenPropsRow componentProps }

_Hidden ::
  forall given optionalGiven optionalMissing props required.
  Nub' (HiddenReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (HiddenPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  ReactComponent { | given }
_Hidden = unsafeCoerce _UnsafeHidden

hidden ::
  forall given optionalGiven optionalMissing props required.
  Nub' (HiddenReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (HiddenPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  { | given } -> JSX
hidden props = element _Hidden props

foreign import data HiddenProps :: Type

hiddenProps ::
  forall given optionalGiven optionalMissing props required.
  Nub' (HiddenReqPropsRow ()) required =>
  Prim.Row.Union required optionalGiven given =>
  Nub' (HiddenPropsRow React.Basic.DOM.Props_div) props =>
  Prim.Row.Union given optionalMissing props =>
  { | given } -> HiddenProps
hiddenProps = unsafeCoerce
