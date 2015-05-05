doctest-prop
============

Now that the upstream package [doctest](https://github.com/sol/doctest) has integrated support for [QuickCheck properties](https://github.com/sol/doctest#quickcheck-properties), this package had fulfilled its role and is deprecated. __Please use the [quickcheck properties](https://github.com/sol/doctest#quickcheck-properties) in doctest.__


What this package used to be
------

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
