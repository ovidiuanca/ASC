assume CS:code, DS:data
data segment
	a dw 1010101010101010b
	b dw 1111111100000000b
	c dw ?
data ends
code segment
start:
	mov AX, data
	mov DS, AX
	
	mov AX, a
	mov CL, 11
	shr AX, CL
	mov BL, 00011111b
	mov BH, 0
	and AX, BX

	mov BL, 11110000b
	mov BH, 00001111b
	or  AX, BX
	
	mov DX, b
	mov CL, 4
	shl DX, CL
	mov BL, 11110000b
	mov BH, 0
	or  DX, BX
	or  AX, DX
	mov c, AX

	mov AX, 4C00h
	int 21h
code ends
end start
