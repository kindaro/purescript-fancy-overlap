module Mint where

import Prelude

import Display

newtype Mint = Mint Int
instance CustomDisplay Mint where customDisplay (Mint int) = "custom display " <> show int <> " haha"
