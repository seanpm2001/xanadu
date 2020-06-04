(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

(*
#staload
"./../SATS/string.sats"
*)

(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

impltmp<>
string_nilq(cs) =
char_eqzq
(string_head_opt(cs))
impltmp<>
string_consq(cs) =
char_neqzq
(string_head_opt(cs))

(* ****** ****** *)

impltmp<>
string_head(cs) =
(string_head_raw(cs))
impltmp<>
string_tail(cs) =
(string_tail_raw(cs))

(* ****** ****** *)
//
(*
impltmp<>
string_head_opt(cs) = ...
*)
//
impltmp<>
string_tail_opt(cs) =
if
nilq(cs)
then
optn_vt_nil()
else
optn_vt_cons(string_tail_raw(cs))
//
(* ****** ****** *)

impltmp<>
string_forall
  (xs) =
( loop(xs) ) where
{
//
typedef x0 = cgtz
typedef xs = string
//
fun
loop(xs: xs): bool =
if
string_nilq
  (xs)
then true else
let
val x0 =
string_head_raw(xs)
in
if
forall$test<x0>(x0)
then
loop
(string_tail_raw(xs)) else false
// end of [if]
end // end of [else]
} (* end of [string_forall/uncons] *)

(* ****** ****** *)

impltmp<>
string_make_list
  (cs) =
(
string_vt2t
(string_vt_make_list<>(cs))
)

(* ****** ****** *)

impltmp<>
string_vt_make_list
  {n}(cs) =
let
val n0 =
list_length<>(cs)
val p0 =
strptr_make<>(n0)
in
$UN.cast01(p0) where
{
val i0 = 0
val () = loop(p0, i0, cs)
}
end where
{
//
fun
loop
{i:nat
|i<=n}.<n-i>.
( p0
: strptr(n)
, i0: int(i)
, cs
: list(cgtz, n-i)): void =
(
case+ cs of
| list_nil() => ()
| list_cons(c0, cs) =>
  (
    loop(p0, succ(i0), cs)
  ) where
  {
    val () =
    strptr_set_at<>(p0, i0, c0)
  }
)
//
} (* end of [string_vt_make_list] *)

(* ****** ****** *)

local
//
typedef x0 = cgtz
typedef xs = string
//
in (* in-of-local *)

(* ****** ****** *)

impltmp
g_cmp<xs> = gseq_cmp<x0,xs>

(* ****** ****** *)
//
impltmp
g_print<xs> = string_print<>
//
(*
impltmp
g_print<xs>(xs) =
gseq_print<xs,x0>(xs)
impltmp
gseq_print$beg<x0,xs>() = ()
impltmp
gseq_print$end<x0,xs>() = ()
impltmp
gseq_print$sep<x0,xs>() = ()
*)
//
(* ****** ****** *)

impltmp
gseq_nilq<x0,xs> = string_nilq<>
impltmp
gseq_consq<x0,xs> = string_consq<>

(* ****** ****** *)

impltmp
gseq_forall<x0,xs> = string_forall<>

(* ****** ****** *)

impltmp
gseq_head_raw<x0,xs> = string_head_raw<>
impltmp
gseq_tail_raw<x0,xs> = string_tail_raw<>

(* ****** ****** *)

impltmp
gseq_unlist<x0,xs> = string_make_list
impltmp
gseq_unlist_vt<x0,xs> = string_make_list_vt

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [string.dats] *)
