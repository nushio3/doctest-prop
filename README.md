doctest-prop
============

This package allows you to write QuickCheck properties within doctest,
using functions that keep silence when test succeeds and print out the
test outputs otherwise.

To enjoy behavior driven development in Haskell, first import 
`Test.DocTest.Prop`, and use `prop`, `propWith` and `unit` to write 
in-place tests, as follows.

```
import Test.DocTest.Prop
prop $ \x -> x*2 == x+x
prop ((<2) . fromEnum :: Bool -> Bool)
propWith (quietArgs{maxSize=3}) $ (<10).length
assert $ 1+1==2
```