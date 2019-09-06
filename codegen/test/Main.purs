module Test.Main where

import Prelude

import Codegen.Model (PropType(..), Variant(..), VariantProp(..), arrayJSX, componentProps, jsx)
import Control.Monad.Error.Class (class MonadError, catchError, throwError)
import Control.Monad.Except (ExceptT, runExceptT)
import Control.Monad.State (class MonadState, StateT, get, put, runStateT)
import Data.Either (Either(..), either)
import Data.Traversable (traverse)
import Data.TraversableWithIndex (traverseWithIndex)
import Data.Tuple (Tuple(..))
import Effect (Effect)
import Effect.Class.Console (logShow)
import Effect.Console (log)
import Foreign.Object (Object)
import Foreign.Object as O
import Global.Unsafe (unsafeStringify)
import ReadDTS.Process (processDTSWith)
import ReadDTS.Types as T

typesToVariant ∷ ∀ m. MonadError String m ⇒ Array T.Type → m (Array VariantProp)
typesToVariant types = traverse f types # either throwError pure
  where
    f t = case t of
      T.StringLiteral s → Right $ StringVariant s
      otherwise → Left $ "illegal type (" <> show t <> ") in variant"

onUnion
  ∷ ∀ m
  . MonadError String m
  ⇒ MonadState { id ∷ Int, variants ∷ Array Variant } m
  ⇒ Array T.Type → m PropType
onUnion types = do
  { id, variants } ← get
  variantProps ← typesToVariant types
  let 
    variantName = "v" <> show id
    v = SimpleVariant variantName variantProps
  put { id: id + 1, variants: variants <> [v] }
  pure $ Local variantName

onPrimitive ∷ ∀ m. MonadError String m ⇒ String → m PropType
onPrimitive n =
  case n of
    "string" → pure StringProp
    "boolean" → pure BooleanProp
    "number" → pure NumberProp
    "unit" → pure UnitProp
    otherwise → throwError $ "invalid primitive: " <> n

type VariantState = { id ∷ Int, variants ∷ Array Variant }

onDTSType
  ∷ ∀ m
  . MonadError String m
  ⇒ MonadState VariantState m
  ⇒ T.Type → m PropType
onDTSType = case _ of
  T.Union types → onUnion types
  T.Primitive name → onPrimitive name
  T.StringLiteral s →
    throwError $ "unsupported string literal: " <> s <> " for PropType"
  T.NumberLiteral n → 
    throwError $ "unsupported number literal: " <> show n <> " for PropType"
  T.Unknown n →
    throwError $ "unknown " <> n <> "; provide it in the Object yourself"

wrapErrorsWithPropName ∷ ∀ m a. MonadError String m ⇒ String → m a → m a
wrapErrorsWithPropName propName m = do
  catchError m $ \e → throwError $ "Error in '" <> propName <> "': " <> e

mainTest ∷ StateT VariantState (ExceptT String Effect) Unit
mainTest = do
  let
    path = "test/simple.d.ts"
    -- path = "/home/kamirus/purescript/work/purescript-react-basic-mui/node_modules/@material-ui/core/Badge/Badge.d.ts"
    name = "Badge"
    (obj ∷ Object (_ PropType)) = map pure $ O.empty
      # O.insert "badgeContent" jsx
      # O.insert "children" arrayJSX
      # O.insert "component" (ReactComponent $ TypeVariable componentProps)
  testr ← processDTSWith identity path name O.empty
  logShow testr.props

  r@{ classKey } ← processDTSWith onDTSType path name obj
  -- traverse the Object and check for errors
  props ← traverseWithIndex wrapErrorsWithPropName r.props

  logShow $ unsafeStringify props

  pure unit

main ∷ Effect Unit
main = do
  m ← runExceptT $ runStateT mainTest { id: 0, variants: [] }
  case m of
    Left err → log err
    Right (Tuple a s) → do
      log $ unsafeStringify s
  pure unit
