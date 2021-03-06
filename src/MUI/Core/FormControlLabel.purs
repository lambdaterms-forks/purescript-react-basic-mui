{- This module was autogenerated. Please don't edit. -}
module MUI.Core.FormControlLabel where

import Foreign (Foreign) as Foreign
import MUI.Core (JSS, class Nub')
import MUI.Core.Styles (Theme, withStyles) as MUI.Core.Styles
import Prelude
import Prim.Row (class Union) as Prim.Row
import React.Basic (JSX, ReactComponent, element)
import React.Basic.DOM (Props_label) as React.Basic.DOM
import React.Basic.Events (EventHandler) as React.Basic.Events
import Unsafe.Coerce (unsafeCoerce)
import Unsafe.Reference (unsafeRefEq)

foreign import data LabelPlacement :: Type

labelPlacement ::
  { bottom :: LabelPlacement
  , end :: LabelPlacement
  , start :: LabelPlacement
  , top :: LabelPlacement
  }
labelPlacement = { bottom: unsafeCoerce "bottom", end: unsafeCoerce "end", start: unsafeCoerce "start", top: unsafeCoerce "top" }

instance eqLabelPlacement :: Eq LabelPlacement where
  eq = unsafeRefEq

type FormControlLabelClassesGenericRow a
  = ( disabled :: a
    , label :: a
    , labelPlacementBottom :: a
    , labelPlacementStart :: a
    , labelPlacementTop :: a
    , root :: a
    )

type FormControlLabelClassesKey
  = FormControlLabelClassesGenericRow String

type FormControlLabelClassesJSS
  = FormControlLabelClassesGenericRow JSS

type FormControlLabelOptPropsRow (r :: #Type)
  = ( checked :: Boolean
    , classes :: { | FormControlLabelClassesKey }
    , disabled :: Boolean
    , labelPlacement :: LabelPlacement
    , name :: String
    , onChange :: React.Basic.Events.EventHandler
    , value :: Foreign.Foreign
    | r
    )

type FormControlLabelReqPropsRow (r :: #Type)
  = ( control :: JSX
    , label :: JSX
    | r
    )

type FormControlLabelPropsRow (r :: #Type)
  = FormControlLabelOptPropsRow (FormControlLabelReqPropsRow r)

foreign import _UnsafeFormControlLabel :: forall componentProps. ReactComponent { | FormControlLabelPropsRow componentProps }

_FormControlLabel ::
  forall given optionalMissing props.
  Nub' (FormControlLabelPropsRow React.Basic.DOM.Props_label) props =>
  Prim.Row.Union given optionalMissing props =>
  ReactComponent { | FormControlLabelReqPropsRow given }
_FormControlLabel = unsafeCoerce _UnsafeFormControlLabel

formControlLabel ::
  forall given optionalMissing props.
  Nub' (FormControlLabelPropsRow React.Basic.DOM.Props_label) props =>
  Prim.Row.Union given optionalMissing props =>
  { | FormControlLabelReqPropsRow given } -> JSX
formControlLabel props = element _FormControlLabel props

formControlLabelWithStyles ::
  forall jss_ jss given optionalMissing props.
  Nub' (FormControlLabelPropsRow React.Basic.DOM.Props_label) props =>
  Prim.Row.Union given optionalMissing props =>
  Prim.Row.Union jss jss_ FormControlLabelClassesJSS =>
  (MUI.Core.Styles.Theme -> { | jss }) -> { | FormControlLabelReqPropsRow given } -> JSX
formControlLabelWithStyles style props = element (withStyles' style _FormControlLabel) props
  where
  withStyles' :: (MUI.Core.Styles.Theme -> { | jss }) -> ReactComponent { | FormControlLabelReqPropsRow given } -> ReactComponent { | FormControlLabelReqPropsRow given }
  withStyles' = unsafeCoerce MUI.Core.Styles.withStyles

foreign import data FormControlLabelProps :: Type

formControlLabelProps ::
  forall given optionalMissing props.
  Nub' (FormControlLabelPropsRow React.Basic.DOM.Props_label) props =>
  Prim.Row.Union given optionalMissing props =>
  { | FormControlLabelReqPropsRow given } -> FormControlLabelProps
formControlLabelProps = unsafeCoerce
