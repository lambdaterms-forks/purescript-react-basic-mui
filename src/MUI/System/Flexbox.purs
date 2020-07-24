module MUI.System.Flexbox where

import Literals (StringLit, stringLit)
import Untagged.Union (type (|+|))

type Center = StringLit "center"

center :: Center
center = stringLit

type Column = StringLit "column"

column :: Column
column = stringLit

type ColumnReverse = StringLit "column-reverse"

columnReverse :: ColumnReverse
columnReverse = stringLit

type End = StringLit "end"

end :: End
end = stringLit

type FlexStart = StringLit "flex-start"

flexStart :: FlexStart
flexStart = stringLit

type FlexEnd = StringLit "flex-end"

flexEnd :: FlexEnd
flexEnd = stringLit

type Nowrap = StringLit "nowrap"

nowrap :: Nowrap
nowrap = stringLit

type Row = StringLit "row"

row :: Row
row = stringLit

type RowReverse = StringLit "row-reverse"

rowReverse :: RowReverse
rowReverse = stringLit

type SpaceAround = StringLit "space-around"

spaceAround :: SpaceAround
spaceAround = stringLit

type SpaceBetween = StringLit "space-between"

spaceBetween :: SpaceBetween
spaceBetween = stringLit

type Start = StringLit "start"

start :: Start
start = stringLit

type Stretch = StringLit "stretch"

stretch :: Stretch
stretch = stringLit

type Wrap = StringLit "wrap"

wrap :: Wrap
wrap = stringLit

type WrapReverse = StringLit "wrap-reverse"

wrapReverse :: WrapReverse
wrapReverse = stringLit

type AlignContent = Start |+| Center |+| SpaceBetween |+| SpaceAround

type AlignItems = Start |+| Center |+| Stretch |+| End

type AlignSelf = Start |+| Center |+| Stretch |+| End

type FlexDirection = Column |+| ColumnReverse |+| Row |+| RowReverse

type FlexWrap = Nowrap |+| Wrap |+| WrapReverse

type JustifyContent = FlexEnd |+| FlexStart |+| Center |+| SpaceBetween |+| SpaceAround



