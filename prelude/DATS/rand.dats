(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For random values
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

impltmp
<>(*tmp*)
rand_nint() =
rand_nint_limit<>
(rand_nint$limit<>())

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
rand_list() =
rand_list_length<a>
(rand_list$length<>())
//
impltmp
{a:vt}
rand<list(a)> = rand_list<a>
//
(* ****** ****** *)
//
(*
HX-2020-06-22:
the default [16]
is randomly chosen
*)
//
impltmp
<>(*tmp*)
rand_list$length =
(rand_nint_limit<>(16))
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
rand_list_length
( ln ) =
(
gint_map_list_nint<a>(ln)
) where
{
impltmp
map$fopr<int><a>(_) = rand<a>()
}
//
(* ****** ****** *)

(* end of [rand.sats] *)
