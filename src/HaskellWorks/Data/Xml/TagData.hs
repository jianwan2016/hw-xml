module HaskellWorks.Data.Xml.TagData where

import Data.Monoid                    ((<>))
import HaskellWorks.Data.Xml.RawValue

import qualified Data.Map as M

data TagData = TagData
  { tagDataAttributes :: M.Map String String
  , tagDataChildNodes :: [RawValue]
  } deriving (Eq, Show)

instance Monoid TagData where
  mappend (TagData aa an) (TagData ba bn) = TagData (aa <> ba) (an <> bn)
  mempty = TagData M.empty []
