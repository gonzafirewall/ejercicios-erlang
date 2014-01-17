-module(temp).

-compile(export_all).

f2c(F) -> (F - 32) * 5/9. 

c2f(C) -> C * 9/5 + 32.

convert({c, Val}) -> {f, c2f(Val)};
convert({f, Val}) -> {c, f2c(Val)}.
