module Paths_hs_rest_api (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/koshin/Projects/personal/hs-rest-api/.stack-work/install/x86_64-osx/lts-5.12/7.10.3/bin"
libdir     = "/Users/koshin/Projects/personal/hs-rest-api/.stack-work/install/x86_64-osx/lts-5.12/7.10.3/lib/x86_64-osx-ghc-7.10.3/hs-rest-api-0.1.0.0-7OWFeam62LH6Z3BJV442QQ"
datadir    = "/Users/koshin/Projects/personal/hs-rest-api/.stack-work/install/x86_64-osx/lts-5.12/7.10.3/share/x86_64-osx-ghc-7.10.3/hs-rest-api-0.1.0.0"
libexecdir = "/Users/koshin/Projects/personal/hs-rest-api/.stack-work/install/x86_64-osx/lts-5.12/7.10.3/libexec"
sysconfdir = "/Users/koshin/Projects/personal/hs-rest-api/.stack-work/install/x86_64-osx/lts-5.12/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hs_rest_api_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hs_rest_api_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hs_rest_api_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hs_rest_api_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hs_rest_api_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
