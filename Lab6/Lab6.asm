assume CS:code, DS:data
data segment
	s1 db 1, 5, 3, 8, 2, 9
	lenS equ $ - s1
	d1 db lenS dup(?)
	d2 db lenS dup(?)
	doi db 2
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov bx, 0
	mov si, 0
	mov bp, 0
	nicumuresan:
		mov al, s1[bx]
		mov ah, 0
		div doi
		cmp ah, 0
		JE evenn
			mov al, s1[bx]
			mov d2[bp], al
			inc bp
			inc bx
		evenn:
		cmp ah, 1
		JE oddd
			mov al, s1[bx]
			mov d1[si], al
			inc bx
			inc si
		oddd:
		cmp bx, lenS
		JB nicumuresan
	
	mov ax, 4C00h
	int 21h
code ends
end start

