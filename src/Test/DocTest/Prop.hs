{-|

This package allows you to write QuickCheck properties within doctest,
using functions that keep silence when test succeeds and print out the
test outputs otherwise.

To enjoy behavior driven development in Haskell, first import 
@Test.DocTest.Prop@, and use @prop@, @propWith@ and @unit@ to write 
in-place tests, as follows.

>>> import Test.DocTest.Prop
>>> prop $ \x -> x*2 == x+x
>>> prop ((<2) . fromEnum :: Bool -> Bool)
>>> propWith (quietArgs{maxSize=3}) $ (<10).length
>>> unit $ 1+1==2

-}

module Test.DocTest.Prop
       (prop, propWith, quietArgs, unit) where


import Test.QuickCheck

-- | The standard arguments for QuickCheck but the chatty flag is off.
quietArgs :: Args
quietArgs = stdArgs {chatty = False}

-- | Test the QuickCheck property.
prop :: Testable p => p -> IO ()
prop p = do
  r <- quickCheckWithResult quietArgs p
  case r of
    Success _ _ _ -> return ()
    _ -> putStrLn $ output r

-- | @prop@ with customized arguments.
propWith :: Testable p => Args -> p -> IO ()
propWith args p = do
  r <- quickCheckWithResult args  p
  case r of
    Success _ _ _ -> return ()
    _ -> putStrLn $ output r

-- | Test for an unchanging property.
unit :: Bool -> IO ()
unit True  = return ()
unit False = putStrLn "Failure"