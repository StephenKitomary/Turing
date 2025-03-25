#lang turing
;; Tape
_
;; Parameters
begin 0 0 500
;; Body
begin _ P@,R,P1 new

;;new
new @ R mark-digits
new * L new
new _ L new

;;mark-digits
mark-digits 0 R,Px,R mark-digits
mark-digits 1 R,Px,R mark-digits
mark-digits _ R,Pz,R,R,Pr find-x

;;find-x
find-x x E first-r
find-x @ R,L find-digits
find-x * L,L find-x
find-x _ L,L find-x

;;first-r
first-r r R,R last-r
first-r * R,R first-r
first-r _ R,R first-r

;;last-r
last-r r R,R last-r
last-r _ Pr,R,R,Pr find-x

;;find-digits
find-digits @ R,R find-1st-digit
find-digits * L,L find-digits
find-digits _ L,L find-digits

;;find-1st-digit
find-1st-digit x L found-1st-digit
find-1st-digit y L found-1st-digit
find-1st-digit z L found-2nd-digit
find-1st-digit _ R,R find-1st-digit

;;found-1st-digit
found-1st-digit 0 R add-zero
found-1st-digit 1 R,R,R find-2nd-digit

;;find-2nd-digit
find-2nd-digit x L found-2nd-digit
find-2nd-digit y L found-2nd-digit
find-2nd-digit _ R,R find-2nd-digit

;;found-2nd-digit
found-2nd-digit 0  R add-zero
found-2nd-digit 1 R add-one
found-2nd-digit _ R add-one

;;add-zero
add-zero r Ps add-finished
add-zero u Pv add-finished
add-zero * R,R add-zero
add-zero _ R,R add-zero

;;add-one
add-one r Pv add-finished
add-one u Ps,R,R carry
add-one * R,R add-one
add-one _ R,R add-one

;;carry
carry r Pu add-finished
carry _ Pu new-digit-is-zero
caryy u Pr,R,R carry

;;add-finished
add-finished @ R,R erase-old-x
add-finished * L,L add-finished
add-finished _ L,L add-finished

;;eerase-old-x
erase-old-x x E,L,L print-new-x
erase-old-x z Py,L,L print-new-x
erase-old-x * R,R erase-old-x
erase-old-x _ R,R erase-old-x

;;print-new-x
print-new-x @ R,R erase-old-y
print-new-x y Pz find-digits
print-new-x _ Px find-digits

;;erase-old-y
erase-old-y y E,L,L print-new-y
erase-old-y * R,R erase-old-y
erase-old-y _ R,R erase-old-y

;;print-new-y
print-new-y @ R, new-digit-is-one
print-new-y * Py,R reset-new-x
print-new-y _ Py,R reset-new-x

;reset-new-x
reset-new-x _ R,Px flag-result-digits
reset-new-x * R,R reset-new-x

;;flag-result-digits
flag-result-digits s Pt,R,R unflag-result-digits
flag-result-digits v Pw,R,R unflag-result-digits
flag-result-digits * R,R flag-result-digits
flag-result-digits _ R,R flag-result-digits

;;unflag-result-digits
unflag-result-digits s Pr,R,R unflag-result-digits
unflag-result-digits v Pu,R,R unflag-result-digits
unflag-result-digits * L,R find-digits
unflag-result-digits _ L,R find-digits

;;new-digit-is-zero
new-digit-is-zero @ R print-zero-digit
new-digit-is-zero * L new-digit-is-zero
new-digit-is-zero _ L new-digit-is-zero

;;print-zero-digit
print-zero-digit 0 R,E,R print-zero-digit
print-zero-digit 1 R,E,R print-zero-digit
print-zero-digit _ P0,R,R,R cleanup

;;new-digit-is-one
new-digit-is-one @ R print-one-digit
new-digit-is-one * L new-digit-is-one
new-digit-is-one _ L new-digit-is-one

;;print-one-digit
print-one-digit 0 R,E,R print-one-digit
print-one-digit 1 R,E,R print-one-digit
print-one-digit _ P1,R,R,R cleanup

;;cleanup
cleanup _ L,R new
cleanup * E,R,R cleanup
