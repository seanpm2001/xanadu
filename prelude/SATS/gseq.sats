(* ****** ****** *)
(*
** For gseq-operations
*)
(* ****** ****** *)
//
(*
//
// HX-2020-02-26:
// this idea is abandoned!!!
//
absprop
gseq_prop
(x0: tflt, xs: tflt)
propdef
gseq
( x0: tflt
, xs: tflt) = gseq_prop(x0, xs)
*)
//
(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_nil(): xs
fun
<x0:t0
,xs:t0>
gseq_cons(x0, xs): xs

(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_nilq(xs): bool
fun
<x0:t0
,xs:t0>
gseq_consq(xs): bool
//
(*
fun
<x0:t0
,xs:t0>
gseq_is_nil(xs): bool
fun
<x0:t0
,xs:t0>
gseq_is_cons(xs): bool
*)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_head_raw(xs): x0
fun
<x0:t0
,xs:t0>
gseq_tail_raw(xs): xs
//
fun
<x0:t0
,xs:t0>
gseq_head_exn(xs): x0
fun
<x0:t0
,xs:t0>
gseq_tail_exn(xs): xs
//
fun
<x0:t0
,xs:t0>
gseq_head_opt(xs): optn_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_tail_opt(xs): optn_vt(xs)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_last_raw(xs): x0
fun
<x0:t0
,xs:t0>
gseq_last_exn(xs): x0
fun
<x0:t0
,xs:t0>
gseq_last_opt(xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_uncons_raw
  (xs: &xs >> xs): x0
fun
<x0:t0
,xs:t0>
gseq_uncons_exn
  (xs: &xs >> xs): x0
fun
<x0:t0
,xs:t0>
gseq_uncons_opt
  (xs: &xs >> xs): optn_vt(x0)
//
(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_cmp(xs, xs): sint

(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_print(xs: xs): void
fun
<x0:t0
,xs:t0>
gseq_print$beg((*void*)): void
fun
<x0:t0
,xs:t0>
gseq_print$end((*void*)): void
fun
<x0:t0
,xs:t0>
gseq_print$sep((*void*)): void

(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_length(xs): nint

(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_drop
(xs: xs, n0: sint): xs
//
fun
<x0:t0
,xs:t0>
gseq_dropif(xs: xs): xs
//
(* ****** ****** *)
//
(*
gseq_foldl: foldl$fopr
gseq_foldr: foldr$fopr
*)
//
fun
<x0:t0
,xs:t0>
<r0:vt>
gseq_foldl(xs, r0): r0
fun
<x0:t0
,xs:t0>
<r0:vt>
gseq_foldr(xs, r0): r0
//
(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_forall(xs): bool
fun
<x0:t0
,xs:t0>
gseq_foreach(xs): void

(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_listize(xs): list_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_rlistize(xs): list_vt(x0)
//
fun
<x0:t0
,xs:t0>
gseq_streamize(xs): stream_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_unlist(list(x0)): (xs)
fun
<x0:t0
,xs:t0>
gseq_unrlist(list(x0)): (xs)
//
fun
<x0:t0
,xs:t0>
gseq_unlist_vt(list_vt(x0)): (xs)
fun
<x0:t0
,xs:t0>
gseq_unrlist_vt(list_vt(x0)): (xs)
//
fun
<x0:t0
,xs:t0>
gseq_unstream_vt(stream_vt(x0)): (xs)
//
(* ****** ****** *)
//
(*
gseq_map: map$fopr
*)
//
fun
<x0:t0
,xs:t0>
<y0:vt>
gseq_map_list(xs): list_vt(y0)
fun
<x0:t0
,xs:t0>
<y0:vt>
gseq_map_rlist(xs): list_vt(y0)
//
fun
<x0:t0
,xs:t0>
<y0:vt>
gseq_map_stream(xs): stream_vt(y0)
//
(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_copy_list(xs): list_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_copy_rlist(xs): list_vt(x0)

(* ****** ****** *)

fun
<x0:t0
,xs:t0>
gseq_filter_list(xs): list_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_filter_rlist(xs): list_vt(x0)

(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>gseq_add(xs): x0
fun
<x0:t0
,xs:t0>gseq_mul(xs): x0
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_max_exn(xs): x0
fun
<x0:t0
,xs:t0>
gseq_min_exn(xs): x0
//
fun
<x0:t0
,xs:t0>
gseq_max_opt(xs): optn_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_min_opt(xs): optn_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>gseq_max2(xs, x0): x0
fun
<x0:t0
,xs:t0>gseq_min2(xs, x0): x0
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_rforall(xs): bool
fun
<x0:t0
,xs:t0>
gseq_rforeach(xs): void
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_append(xs1: xs, xs2: xs): xs
//
fun
<x0:t0
,xs:t0>
gseq_reverse(xs: xs): xs
fun
<x0:t0
,xs:t0>
gseq_rappend(xs1: xs, xs2: xs): xs
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_iforall(xs): bool
fun
<x0:t0
,xs:t0>
gseq_iforeach(xs): void
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_indexof
(xs: xs, x0: x0): sint // ~1: ~found
fun
<x0:t0
,xs:t0>
gseq_rindexof
(xs: xs, x0: x0): sint // ~1: ~found
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_idropif(xs: xs): xs
//
fun
<x0:t0
,xs:t0>
gseq_itakeif_list(xs): list_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_itakeif_rlist(xs): list_vt(x0)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_ifilter_list(xs): list_vt(x0)
fun
<x0:t0
,xs:t0>
gseq_ifilter_rlist(xs): list_vt(x0)
//
(* ****** ****** *)
//
// For 2-gseq-operations
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
<r0:vt>
gseq_z2foldl
  ( xs: xs
  , ys: ys, r0: r0): r0
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
<r0:vt>
gseq_z2foldr
  ( xs: xs
  , ys: ys, r0: r0): r0
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
gseq_z2forall
  (xs: xs, ys: ys): bool
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
gseq_z2forcmp
  (xs: xs, ys: ys): sint
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
gseq_z2foreach
  (xs: xs, ys: ys): void
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
<z0:vt>
gseq_z2map_list
  (xs: xs, ys: ys): list_vt(z0)
fun
<x0:t0
,xs:t0>
<y0:t0
,ys:t0>
<z0:vt>
gseq_z2map_rlist
  (xs: xs, ys: ys): list_vt(z0)
//
(* ****** ****** *)
//
fun
<x0:t0
,xs:t0>
gseq_permutize(xs: xs): stream_vt(xs)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for gseq
//
(* ****** ****** *)

#symload
nilq with gseq_nilq of 0100
#symload
consq with gseq_consq of 0100

(* ****** ****** *)

#symload
head with gseq_head_exn of 0100
#symload
head_exn with gseq_head_exn of 0100
#symload
head_opt with gseq_head_opt of 0100

(* ****** ****** *)

#symload
tail with gseq_tail_exn of 0100
#symload
tail_exn with gseq_tail_exn of 0100
#symload
tail_opt with gseq_tail_opt of 0100

(* ****** ****** *)

#symload
length with gseq_length of 0100

(* ****** ****** *)
//
#symload foldl with gseq_foldl of 0100
#symload forall with gseq_forall of 0100
#symload foreach with gseq_foreach of 0100
//
(* ****** ****** *)
//
#symload max2 with gseq_max2 of 0100
#symload min2 with gseq_min2 of 0100
//
#symload max_exn with gseq_max_exn of 0100
#symload min_exn with gseq_min_exn of 0100
//
#symload max_opt with gseq_max_opt of 0100
#symload min_opt with gseq_min_opt of 0100
//
(* ****** ****** *)
//
#symload foldr with gseq_foldr of 0100
#symload rforall with gseq_rforall of 0100
#symload rforeach with gseq_rforeach of 0100
//
(* ****** ****** *)

#symload listize with gseq_listize of 0100
#symload rlistize with gseq_rlistize of 0100
#symload streamize with gseq_streamize of 0100

(* ****** ****** *)

#symload map_list with gseq_map_list of 0100
#symload map_rlist with gseq_map_rlist of 0100
#symload map_stream with gseq_map_stream of 0100

(* ****** ****** *)

#symload iforall with gseq_iforall of 0100
#symload iforeach with gseq_iforeach of 0100

(* ****** ****** *)

(* end of [gseq.sats] *)
