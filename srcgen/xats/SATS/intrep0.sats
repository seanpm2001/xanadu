(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June 17, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./basics.sats"

(* ****** ****** *)

abstype htvar_tbox = ptr
typedef htvar = htvar_tbox

(* ****** ****** *)
//
abstype h0typ_tbox = ptr
//
typedef h0typ = h0typ_tbox
typedef h0typlst = List0(h0typ)
typedef h0typopt = Option(h0typ)
//
(* ****** ****** *)
//
abstype hdvar_tbox = ptr
abstype hdcon_tbox = ptr
abstype hdcst_tbox = ptr
typedef hdvar = hdvar_tbox
typedef hdcon = hdcst_tbox
typedef hdcst = hdcst_tbox
//
(* ****** ****** *)
//
abstype h0exp_tbox = ptr
typedef h0exp = h0exp_tbox
//
(* ****** ****** *)

typedef h0explst = List0(h0exp)
typedef h0expopt = Option(h0exp)

(* ****** ****** *)

(* end of [xats_intrep0.sats] *)
