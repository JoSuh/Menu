; Add_Sub_Example.asm
;
; This program sums the first two values stored in an array starting at $1000
; 	and then subtracts the third value in the array
;	from the result of the addition.
; Finally, it stores the result of the
; 	subtraction location that immediately follow the array.
;
; Note: all digits are unsigned


; Program Constants
STACK   equ     $2000

        org     $1000         	; Data area
Array   db      $10, $23, $18 	; Data to manipulate
Result  ds      1             	; Result stored here

        org     $2000           ; Program area
Start   lds     #Stack          ; Stack location
        clra                    ; Controlled situation
        ldaa    Array           ; First Value
        ldab    Array+1         ; Second Value
        aba                     ; First Value + Second Value with result in A
        ldab    Array+2         ; Third Value
        sba                     ; Subtract Third Value from Previous Sums
				; 	with result in A
        staa Result             ; Store Results
        swi
        end
