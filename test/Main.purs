module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Class.Console (log)

import Display
import Mint

main :: Effect Unit
main = do
  log (display 10)
  log (display "show me")
  log (display (Mint 10))
