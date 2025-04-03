#lang turing
;; Tape
_
;; Parameters
begin 0 0 150000
;; Body
begin _ P@,R,P@,R,P1 new
;; New
new @ R mark-digits
new * L new
new _ L new
;; Mark Digits
mark-digits 0 R,Px,R mark-digits
mark-digits 1 R,Px,R mark-digits
mark-digits _ R,Pz,R,R,Pr find-x
;; Find X
find-x x E first-r
find-x @ R,L find-digits
find-x * L,L find-x
find-x _ L,L find-x
;; First R
first-r r R,R last-r
first-r * R,R first-r
first-r _ R,R first-r
;; Last R
last-r r R,R last-r
last-r _ Pr,R,R,Pr,R,R,Pr find-x
;; Find Digits
find-digits @ R,R find-1st-digit
find-digits * L,L find-digits
find-digits _ L,L find-digits
;; Find first digit
find-1st-digit x L found-1st-digit
find-1st-digit y L found-1st-digit
find-1st-digit z L found-2nd-digit
find-1st-digit _ R,R find-1st-digit
;; Found 1st Digit
found-1st-digit 0 R add-zero
found-1st-digit 1 R,R,R find-2nd-digit
;; Find 2nd Digit
find-2nd-digit x L found-2nd-digit
find-2nd-digit y L found-2nd-digit
find-2nd-digit _ R,R find-2nd-digit
;; Found 2nd Digit
found-2nd-digit 0  R add-zero
found-2nd-digit 1 R add-one
found-2nd-digit _ R add-one
;; Add Zero
add-zero r Ps add-finished
add-zero u Pv add-finished
add-zero * R,R add-zero
add-zero _ R,R add-zero
;; Add One
add-one r Pv add-finished
add-one u Ps,R,R carry
add-one * R,R add-one
add-one _ R,R add-one
;; Carry
carry r Pu add-finished
carry _ Pu new-digit-is-zero
carry u Pr,R,R carry
;; Add Finished
add-finished @ R,R erase-old-x
add-finished * L,L add-finished
add-finished _ L,L add-finished
;; Erase old x
erase-old-x x E,L,L print-new-x
erase-old-x z Py,L,L print-new-x
erase-old-x * R,R erase-old-x
erase-old-x _ R,R erase-old-x
;; Print new x
print-new-x @ R,R erase-old-y
print-new-x y Pz find-digits
print-new-x _ Px find-digits
;; Erase Old Y
erase-old-y y E,L,L print-new-y
erase-old-y * R,R erase-old-y
erase-old-y _ R,R erase-old-y
;; Print new y
print-new-y @ R move-to-marks
print-new-y * Py,R reset-new-x
print-new-y _ Py,R reset-new-x
;; Reset new x
reset-new-x _ R,Px flag-result-digits
reset-new-x * R,R reset-new-x
;; Flag result digits
flag-result-digits s Pt,R,R unflag-result-digits
flag-result-digits v Pw,R,R unflag-result-digits
flag-result-digits * R,R flag-result-digits
flag-result-digits _ R,R flag-result-digits
;; Unflag result digits
unflag-result-digits s Pr,R,R unflag-result-digits
unflag-result-digits v Pu,R,R unflag-result-digits
unflag-result-digits * L,R find-digits
unflag-result-digits _ L,R find-digits
;; New digit is zero
new-digit-is-zero @ R print-zero-digit
new-digit-is-zero * L new-digit-is-zero
new-digit-is-zero _ L new-digit-is-zero
;; Print zero
print-zero-digit 0 R,E,R print-zero-digit
print-zero-digit 1 R,E,R print-zero-digit
print-zero-digit _ P0,R,R,R cleanup
;; New digit is one
new-digit-is-one @ R print-one-digit
new-digit-is-one * L new-digit-is-one
new-digit-is-one _ L new-digit-is-one
;; Print one
print-one-digit 0 R,E,R print-one-digit
print-one-digit 1 R,E,R print-one-digit
print-one-digit _ P1,R,R,R cleanup
;; Clean up
cleanup _ L,R new
cleanup * E,R,R cleanup
;; Move to sentinal
move-to-mark @ R move-to-marks
move-to-mark * L move-to-mark
move-to-mark _ L move-to-mark
;; Move to marks
move-to-marks w _ move-to-second
move-to-marks t _ move-to-second
move-to-marks * R move-to-marks
move-to-marks _ R move-to-marks
;; Goto the second significant digit
move-to-second * R,R move-to-second
move-to-second _ L,L check-first
;; Check first significant digit
check-first u L,L check-second
check-first r L,L check-first
;; Checking the second significant digit
check-second s _ new-digit-is-one
check-second t _ new-digit-is-one
check-second * _ new-digit-is-zero
