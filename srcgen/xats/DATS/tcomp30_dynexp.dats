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
// Start Time: July, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#include
"./../HATS/xatsopt.hats"
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

#staload "./../SATS/tcomp30.sats"

(* ****** ****** *)
//
implement
tcomp30_program
  (prog0) =
  (prog1) where
{
//
val
prog1 =
tcomp30_declist(prog0)
//
} (* end of [tcomp30_program] *)
//
(* ****** ****** *)

implement
tcomp30_dvar
  (d2v0) =
let
val opt =
the_dvarmap_search_opt(d2v0)
in
case+ opt of
| ~
Some_vt(hdv1) => hdv1
| ~
None_vt((*void*)) =>
let
val hdv1 =
hdvar_make_dvar(d2v0)
in
the_dvarmap_insert_any(d2v0, hdv1); hdv1
end
end // end of [tcomp30_dvar]

(* ****** ****** *)
//
implement
tcomp30_dvaropt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(d2v0) => Some(tcomp30_dvar(d2v0))
)
//
(* ****** ****** *)

implement
tcomp30_dcon
  (d2c0) =
let
val opt =
the_dconmap_search_opt(d2c0)
in
case+ opt of
| ~
Some_vt(hdc1) => hdc1
| ~
None_vt((*void*)) =>
let
val hdc1 =
hdcon_make_dcon(d2c0)
in
the_dconmap_insert_any(d2c0, hdc1); hdc1
end
end // end of [tcomp30_dcon]

implement
tcomp30_dcst
  (d2c0) =
let
val opt =
the_dcstmap_search_opt(d2c0)
in
case+ opt of
| ~
Some_vt(hdc1) => hdc1
| ~
None_vt((*void*)) =>
let
val hdc1 =
hdcst_make_dcst(d2c0)
in
the_dcstmap_insert_any(d2c0, hdc1); hdc1
end
end // end of [tcomp30_dcst]

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxnil
(d3p0: d3pat): h0pat =
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
in
h0pat_make_node(loc0, h0t0, H0Pnil())
end
fun
auxany
(d3p0: d3pat): h0pat =
let
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
in
h0pat_make_node(loc0, h0t0, H0Pany())
end

(* ****** ****** *)

fun
auxvar
(d3p0: d3pat): h0pat =
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdv1 =
(
  tcomp30_dvar(d2v0)
) where
{
  val-
  D3Pvar(d2v0) = d3p0.node()
}
//
in
h0pat_make_node(loc0, h0t0, H0Pvar(hdv1))
end

(* ****** ****** *)

in

implement
tcomp30_dpat
  (d3p0) = let
//
(*
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val () =
println!
("tcomp30_dpat: d3p0 = ", d3p0)
val () =
println!
("tcomp30_dpat: t2p0 = ", t2p0)
*)
//
in
//
case+
d3p0.node() of
//
|
D3Pnil() => auxnil(d3p0)
|
D3Pany() => auxany(d3p0)
//
|
D3Pvar _ => auxvar(d3p0)
//
|
D3Panno
(d3p1, _) => tcomp30_dpat(d3p1)
//
| _(* rest-of_d3pat *) =>
let
//
val
loc0 = d3p0.loc()
val
t2p0 = d3p0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Pnone1($UN.cast{ptr}(d3p0))
//
in
  h0pat_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [tcomp30_dpat]

end // end of [local]

(* ****** ****** *)
implement
tcomp30_dpatlst
  (d3ps) =
list_vt2t(d3ps) where
{
val
d3ps =
list_map<d3pat><h0pat>
  (d3ps) where
{
implement
list_map$fopr<d3pat><h0pat>(d3p) = tcomp30_dpat(d3p)
}
} (* end of [tcomp30_dpatlst] *)
(* ****** ****** *)

implement
tcomp30_farg
  (f3a0) =
let
val
loc0 = f3a0.loc()
in
case+
f3a0.node() of
| F3ARGsome_dyn
  (npf0, d3ps) =>
  let
  val
  h0ps =
  tcomp30_dpatlst(d3ps)
  in
  hfarg_make_node
  (loc0, HFARGnpats(npf0, h0ps))
  end
| _ (* else *) =>
  let
  val
  hend =
  $UN.cast{ptr}(f3a0)
  in
  hfarg_make_node(loc0, HFARGnone1(hend))
  end
end // end of [tcomp30_farg]

(* ****** ****** *)
implement
tcomp30_farglst
  (f3as) =
list_vt2t(f3as) where
{
val
f3as =
list_map<f3arg><hfarg>
  (f3as) where
{
implement
list_map$fopr<f3arg><hfarg>(f3a) = tcomp30_farg(f3a)
}
} (* end of [tcomp30_farglst] *)
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxint
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Eint(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eint(tok))
end // end of [auxint]

fun
auxbtf
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Ebtf(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Ebtf(tok))
end // end of [auxbtf]

fun
auxchr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Echr(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Echr(tok))
end // end of [auxchr]

fun
auxflt
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Eflt(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Eflt(tok))
end // end of [auxflt]

fun
auxstr
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Estr(tok) = d3e0.node()
//
in
h0exp_make_node(loc0, h0t0, H0Estr(tok))
end // end of [auxstr]

(* ****** ****** *)

fun
auxvar
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdv1 =
(
  tcomp30_dvar(d2v0)
) where
{
  val-
  D3Evar(d2v0) = d3e0.node()
}
//
val hend = H0Evar(hdv1)
//
in
h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxvknd
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val-
D3Evknd
(k0, d2v0) = d3e0.node()
val
hdv1 = tcomp30_dvar(d2v0)
//
val hend = H0Evknd(k0, hdv1)
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxfcon
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdc1 =
(
  tcomp30_dcon(d2c0)
) where
{
  val-
  D3Efcon(d2c0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Efcon(hdc1))
end

(* ****** ****** *)

fun
auxfcst
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hdc1 =
(
  tcomp30_dcst(d2c0)
) where
{
  val-
  D3Efcst(d2c0) = d3e0.node()
}
//
in
h0exp_make_node(loc0, h0t0, H0Efcst(hdc1))
end

(* ****** ****** *)

fun
auxdapp
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Edapp(h0f0, npf1, h0es)
) where
{
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
val h0f0 = tcomp30_dexp(d3f0)
val h0es = tcomp30_dexplst(d3es)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
auxseqn
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Eseqn(h0es, h0e1)
) where
{
val-
D3Eseqn
(d3es, d3e1) = d3e0.node()
val
h0es = tcomp30_dexplst(d3es)
val h0e1 = tcomp30_dexp(d3e1)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end

(* ****** ****** *)

fun
aux_let
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Elet(hdcl, h0e1)
) where
{
val-
D3Elet
(d3cs, d3e1) = d3e0.node()
//
val
hdcl = tcomp30_declist(d3cs)
//
val h0e1 = tcomp30_dexp(d3e1)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_let]

(* ****** ****** *)

fun
aux_if0
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
(
  H0Eif0(h0e1, h0e2, opt3)
) where
{
val-
D3Eif0
( d3e1
, d3e2, opt3) = d3e0.node()
val h0e1 = tcomp30_dexp(d3e1)
val h0e2 = tcomp30_dexp(d3e2)
val opt3 = tcomp30_dexpopt(opt3)
}
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_if0]

(* ****** ****** *)

fun
aux_lam
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val hend =
(
H0Elam(knd, hfas, body)
) where
{
val-
D3Elam
( knd
, f3as, res1
, arrw, body) = d3e0.node()
val
hfas = tcomp30_farglst(f3as)
val body = tcomp30_dexp(body)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_fix
(d3e0: d3exp): h0exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val hend =
(
  H0Efix
  (knd, fid, hfas, body)
) where
{
val-
D3Efix
( knd
, fid
, f3as, res1
, arrw, body) = d3e0.node()
//
val fid = tcomp30_dvar(fid)
//
val
hfas = tcomp30_farglst(f3as)
val body = tcomp30_dexp(body)
}
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [aux_fix]

(* ****** ****** *)

in(*in-of-local*)

implement
tcomp30_dexp
  (d3e0) = let
//
#if(__XATSOPT_DEBUG__)
(*
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val () =
println!
("tcomp30_dexp: d3e0 = ", d3e0)
val () =
println!
("tcomp30_dexp: t2p0 = ", t2p0)
*)
#endif//__XATSOPT_DEBUG__
//
in
//
case+
d3e0.node() of
//
|
D3Eint _ => auxint(d3e0)
|
D3Ebtf _ => auxbtf(d3e0)
|
D3Echr _ => auxchr(d3e0)
|
D3Eflt _ => auxflt(d3e0)
|
D3Estr _ => auxstr(d3e0)
//
|
D3Evar _ => auxvar(d3e0)
|
D3Evknd _ => auxvknd(d3e0)
//
|
D3Efcon _ => auxfcon(d3e0)
|
D3Efcst _ => auxfcst(d3e0)
//
|
D3Edapp _ => auxdapp(d3e0)
|
D3Eseqn _ => auxseqn(d3e0)
//
| D3Elet _ => aux_let(d3e0)
//
| D3Eif0 _ => aux_if0(d3e0)
//
| D3Elam _ => aux_lam(d3e0)
| D3Efix _ => aux_fix(d3e0)
//
| _(*rest-of_d3exp*) =>
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
val
h0t0 = tcomp30_type(t2p0)
//
val
hend =
H0Enone1($UN.cast{ptr}(d3e0))
//
in
  h0exp_make_node(loc0, h0t0, hend)
end // end of [let]
//
end // end of [tcomp30_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
tcomp30_dexpopt
  (opt0) =
(
case+ opt0 of
| None() => None()
| Some(d3e) => Some(tcomp30_dexp(d3e))
)
//
implement
tcomp30_dexplst
  (d3es) =
list_vt2t(d3es) where
{
val
d3es =
list_map<d3exp><h0exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><h0exp>(d3e) = tcomp30_dexp(d3e)
}
} (* end of [tcomp30_dexplst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)
//
fun
aux_fundecl
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cfundecl
( knd
, mopt
, tqas
, f3ds) = d3cl.node()
//
fun
auxf3d0
( f3d0
: f3undecl): hfundecl =
let
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
val rtp = rcd.rtp
//
val nam = tcomp30_dvar(nam)
val hdc = tcomp30_dcst(d2c)
val hag =
(
case+ a3g of
|
None() =>
None()
|
Some(f3as) =>
Some(tcomp30_farglst(f3as))
) : hfarglstopt // end-of-val
val rtp = tcomp30_type(rtp)
val def = tcomp30_dexpopt(def)
//
in
HFUNDECL(
@{
 loc=loc,nam=nam
,hdc=hdc,hag=hag,def=def,rtp=rtp}
) (* HFUNDECL *)
end // end of [auxf3d0]
and
auxf3ds
( f3ds
: f3undeclist
)
: hfundeclist =
list_vt2t
(
list_map<f3undecl><hfundecl>(f3ds)
) where
{
implement
list_map$fopr<
  f3undecl><hfundecl>(x0) = auxf3d0(x0)
}
//
val tqas =
tcomp30_tqarglst(tqas)
//
val hfds = auxf3ds(f3ds)
//
in
h0dcl_make_node
(loc0, H0Cfundecl(knd, mopt, tqas, hfds))
end // end of [aux_fundecl]

(* ****** ****** *)
fun
aux_valdecl
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvaldecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( v3d0
: v3aldecl
)
: hvaldecl =
let
//
val+
V3ALDECL
( rcd ) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
tcomp30_dpat(pat)
val def =
tcomp30_dexpopt(def)
//
in
HVALDECL
( @{loc=loc,pat=pat,def=def} )
end // end of [auxv3d0]
and
auxv3ds
( v3ds
: v3aldeclist
)
: hvaldeclist =
list_vt2t
(
list_map<v3aldecl><hvaldecl>(v3ds)
) where
{
implement
list_map$fopr<
  v3aldecl><hvaldecl>(x0) = auxv3d0(x0)
}
//
val hvds = auxv3ds(v3ds)
//
in
h0dcl_make_node
(loc0, H0Cvaldecl(knd, mopt, hvds))
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( d3cl
: d3ecl): h0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cvardecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( v3d0
: v3ardecl
)
: hvardecl =
let
//
val+
V3ARDECL
( rcd ) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val ini = rcd.ini
//
val hdv =
tcomp30_dvar(d2v)
val wth =
tcomp30_dvaropt(wth)
val ini =
tcomp30_dexpopt(ini)
//
in
HVARDECL
(
@{loc=loc,hdv=hdv,wth=wth,ini=ini}
)
end // end of [auxv3d0]
and
auxv3ds
( v3ds
: v3ardeclist
)
: hvardeclist =
list_vt2t
(
list_map<v3ardecl><hvardecl>(v3ds)
) where
{
implement
list_map$fopr<
  v3ardecl><hvardecl>(x0) = auxv3d0(x0)
}
//
val hvds = auxv3ds(v3ds)
//
in
h0dcl_make_node
(loc0, H0Cvardecl(knd, mopt, hvds))
end // end of [aux_vardecl]

(* ****** ****** *)

in(*in-of-local*)

implement
tcomp30_decl
  (d3cl) = let
//
val
loc0 = d3cl.loc()
//
(*
val () =
println!
("tcomp30_decl: d3cl = ", d3cl)
*)
//
in(*in-of-local*)
//
case+
d3cl.node() of
//
| D3Cfundecl _ =>
  (
    aux_fundecl(d3cl)
  )
//
| D3Cvaldecl _ =>
  (
    aux_valdecl(d3cl)
  )
| D3Cvardecl _ =>
  (
    aux_vardecl(d3cl)
  )
//
|
_(* rest-of_d3exp *) =>
let
val
node =
H0Cnone1($UN.cast{ptr}(d3cl))
in h0dcl_make_node(loc0, node) end
//
end // end of [tcomp30_decl]

end // end of [local]

(* ****** ****** *)

implement
tcomp30_declist
  (d3cs) =
list_vt2t(d3cs) where
{
val
d3cs =
list_map<d3ecl><h0dcl>
  (d3cs) where
{
implement
list_map$fopr<d3ecl><h0dcl>(d3c) = tcomp30_decl(d3c)
}
} (* end of [tcomp30_declist] *)

(* ****** ****** *)
//
implement
tcomp30_tqarg
  (tqa0) =
(
  htqarg_make(loc0, htvs)
) where
{
val loc0 = tqa0.loc()
val htvs =
tcomp30_svarlst(tqa0.s2vs())
}

implement
tcomp30_tqarglst
  (tqas) =
list_vt2t(tqas) where
{
val
tqas =
list_map<tq2arg><htqarg>
  (tqas) where
{
implement
list_map$fopr<tq2arg><htqarg>(tqa) = tcomp30_tqarg(tqa)
}
} (* end of [tcomp30_tqarglst] *)
//
(* ****** ****** *)

(* end of [xats_tcomp30_dynexp.dats] *)
