(* ****** ****** *)
(*
** HX-2018-05-16
** Unit testing. Kind of.
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
#staload
"./../../SATS/mylibc.sats"
//
(* ****** ****** *)

local
//
#include "./../../DATS/Posix/mylibc.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

implement
main0() =
{
//
val () =
assertloc(iseqz(xatsopt_chrunq("''")))
val () =
assertloc('a' = xatsopt_chrunq("'a'"))
val () =
assertloc('X' = xatsopt_chrunq("'X'"))
//
val () =
assertloc(iseqz(xatsopt_chrunq("'\\0'")))
//
val () =
assertloc('\a' = xatsopt_chrunq("'\\a'"))
val () =
assertloc('\b' = xatsopt_chrunq("'\\b'"))
val () =
assertloc('\n' = xatsopt_chrunq("'\\n'"))
val () =
assertloc('\r' = xatsopt_chrunq("'\\r'"))
val () =
assertloc('\t' = xatsopt_chrunq("'\\t'"))
val () =
assertloc('\v' = xatsopt_chrunq("'\\v'"))
//
val () =
assertloc('\'' = xatsopt_chrunq("'\\''"))
val () =
assertloc('\"' = xatsopt_chrunq("'\\\"'"))
//
val () =
assertloc('A' = xatsopt_chrunq("'\\101'"))
val () =
assertloc('B' = xatsopt_chrunq("'\\102'"))
val () =
assertloc('Z' = xatsopt_chrunq("'\\132'"))
val () =
assertloc('a' = xatsopt_chrunq("'\\141'"))
val () =
assertloc('b' = xatsopt_chrunq("'\\142'"))
val () =
assertloc('z' = xatsopt_chrunq("'\\172'"))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test_mylibc.dats] *)
