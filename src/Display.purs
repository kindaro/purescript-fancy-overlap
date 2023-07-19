module Display where

import Prelude

data YesOrNo
foreign import data Yes ∷ YesOrNo
foreign import data No ∷ YesOrNo

data Proxy phantom = Proxy

class CanShow ∷ Type → YesOrNo → Constraint
class CanShow subject flag | subject → flag
instance CanShow Int Yes
else instance CanShow String Yes
else instance CanShow otherSubject No

class CustomDisplay subject where customDisplay ∷ subject → String

class Displaying ∷ YesOrNo → Type → Constraint
class Displaying flag subject where displaying ∷ Proxy flag → subject → String
instance (CanShow subject Yes, Show subject) ⇒ Displaying Yes subject where displaying _ = show
instance CustomDisplay subject ⇒ Displaying No subject where displaying _ = customDisplay

class Display ∷ Type → Constraint
class Display subject where display ∷ subject → String
instance (CanShow subject flag, Displaying flag subject) ⇒ Display subject where display = displaying (Proxy ∷ Proxy flag)

