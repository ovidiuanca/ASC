assume CS:code, DS:data
data segment
	s dd 12345678h, 1A2B3C4Dh, 0FE98DC76h
	lenS equ ($ - s)/4
	d db lenS dup(?)
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov bx, 0
	mov si, 0
	nicumuresan:
		mov cl, byte ptr s[bx] + 1
		mov d[si], cl
		inc bx
		inc bx
		inc bx
		inc bx
		inc si
		cmp si, lenS
		JB nicumuresan
	
	mov ax, 4C00h
	int 21h
code ends
end start
