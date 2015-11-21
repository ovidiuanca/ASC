assume cs:code, ds:data
data segment
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov ax, 4C00h
	int 21h
code ends
end start
