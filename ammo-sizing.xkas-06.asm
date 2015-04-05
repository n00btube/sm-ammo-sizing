; Copyright 2015 Adam <https://github.com/n00btube>
; MIT license.
; There _could_ be newer versions available on GitHub.

lorom

; HIJACK POINTS -------------------------------------------
org $84887D
	JSR lda_item_index ; "pickup collected?" PLM, 887C

org $84889A
	JSR lda_item_index ; "collect pickup" PLM, 8899

org $8489AD
	JSR add_room_arg   ; max missiles
org $8489B7
	JSR add_room_arg   ; current missiles

org $8489D6
	JSR add_room_arg   ; max super missiles
org $8489E0
	JSR add_room_arg   ; current super missiles

org $8489FF
	JSR add_room_arg   ; max power bombs
org $848A09
	JSR add_room_arg   ; current power bombs

; ROUTINES ------------------------------------------------

; these can be placed anywhere in bank $84 free space
; 27 ($1B) bytes long
org $84FFC0
lda_item_index:
	LDA $1DC7,X    ; hijacked instruction: room call arg
	AND #$80FF     ; zero out the pickup collection size
	RTS

add_room_arg:
	STA $12         ; save value we're going to add to
	LDA $1DC7,X     ; get room call arg
	AND #$7F00      ; zero out returning bit & item index
	BEQ add_plm_arg ; not set: use PLM arg instead
	XBA             ; move pickup size to the bottom of A
final_add:
	CLC
	ADC $12         ; add original value to increase amount
	RTS
add_plm_arg:
	LDA $0000,Y     ; get PLM arg value
	BRA final_add   ; and add that

