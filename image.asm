          global _start
          section .text
          ; 5 function definition
strlen:   
          push rbp
          mov rbp, rsp
          ; 7 push integer
          mov rax, 0
          push rax
          ; 8 label
while_0x0000000000000001: 
          ; 8 duplicate
          pop rax
          push rax
          push rax
          ; 8 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 8 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 8 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 8 push integer
          mov rax, 0
          push rax
          ; 8 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 8 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000001_end
          ; 9 push integer
          mov rax, 1
          push rax
          ; 9 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 8 end of while-loop
          jmp while_0x0000000000000001
while_0x0000000000000001_end: 
          ; 6 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 6 return
          ret
          ; 12 create buffer
          ; 14 function definition
itos:     
          push rbp
          mov rbp, rsp
          ; 20 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 20 push integer
          mov rax, 0
          push rax
          ; 20 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 20 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000001
          ; 21 push string
          mov rax, s_1
          push rax
          ; 21 jump
          jmp end_0x0000000000000001
          ; 21 label
if_0x0000000000000001: 
          ; 23 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 24 get pointer to buffer
          mov rax, _itos
          push rax
          ; 24 push integer
          mov rax, 19
          push rax
          ; 24 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 25 label
while_0x0000000000000002: 
          ; 25 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 25 push integer
          mov rax, 0
          push rax
          ; 25 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 25 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 25 get pointer to buffer
          mov rax, _itos
          push rax
          ; 25 is greater or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovge rax, rbx
          push rax
          ; 25 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 25 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000002_end
          ; 27 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 27 push integer
          mov rax, 10
          push rax
          ; 27 mod
          xor rdx, rdx
          pop rbx
          pop rax
          div rbx
          push rdx
          ; 30 push character
          mov rax, `0`
          push rax
          ; 30 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 33 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 33 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 36 push integer
          mov rax, 1
          push rax
          ; 36 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 36 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 36 push integer
          mov rax, 10
          push rax
          ; 36 divide
          xor rdx, rdx
          pop rbx
          pop rax
          div rbx
          push rax
          ; 36 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 25 end of while-loop
          jmp while_0x0000000000000002
while_0x0000000000000002_end: 
          ; 38 push integer
          mov rax, 1
          push rax
          ; 38 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 41 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 41 drop
          pop rax
          ; 23 label
end_0x0000000000000001: 
          ; 15 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 15 return
          ret
          ; 44 function definition
traceback: 
          push rbp
          mov rbp, rsp
          ; 46 push integer
          mov rax, 2
          push rax
          ; 47 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 48 duplicate
          pop rax
          push rax
          push rax
          ; 48 push string
          mov rax, s_2
          push rax
          ; 48 push integer
          mov rax, 48
          push rax
          ; 48 push string
          mov rax, s_3
          push rax
          ; 48 push boolean
          mov rax, 1
          push rax
          ; 48 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 49 push integer
          mov rax, 1
          push rax
          ; 50 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 52 push integer
          mov rax, 2
          push rax
          ; 53 push string
          mov rax, s_4
          push rax
          ; 54 duplicate
          pop rax
          push rax
          push rax
          ; 54 push string
          mov rax, s_2
          push rax
          ; 54 push integer
          mov rax, 54
          push rax
          ; 54 push string
          mov rax, s_3
          push rax
          ; 54 push boolean
          mov rax, 1
          push rax
          ; 54 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 55 push integer
          mov rax, 1
          push rax
          ; 56 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 58 label
while_0x0000000000000003: 
          ; 58 get argument
          mov rax, rbp
          add rax, 16
          mov rbx, [rax]
          push rbx
          ; 58 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000003_end
          ; 60 push integer
          mov rax, 2
          push rax
          ; 61 get argument
          mov rax, rbp
          add rax, 40
          mov rbx, [rax]
          push rbx
          ; 62 duplicate
          pop rax
          push rax
          push rax
          ; 62 push string
          mov rax, s_2
          push rax
          ; 62 push integer
          mov rax, 62
          push rax
          ; 62 push string
          mov rax, s_3
          push rax
          ; 62 push boolean
          mov rax, 1
          push rax
          ; 62 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 63 push integer
          mov rax, 1
          push rax
          ; 64 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 65 drop
          pop rax
          ; 67 push integer
          mov rax, 2
          push rax
          ; 68 push string
          mov rax, s_5
          push rax
          ; 69 push integer
          mov rax, 7
          push rax
          ; 70 push integer
          mov rax, 1
          push rax
          ; 71 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 72 drop
          pop rax
          ; 74 push integer
          mov rax, 2
          push rax
          ; 75 get argument
          mov rax, rbp
          add rax, 32
          mov rbx, [rax]
          push rbx
          ; 75 push string
          mov rax, s_2
          push rax
          ; 75 push integer
          mov rax, 75
          push rax
          ; 75 push string
          mov rax, s_3
          push rax
          ; 75 push boolean
          mov rax, 1
          push rax
          ; 75 call
          call itos
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 76 duplicate
          pop rax
          push rax
          push rax
          ; 76 push string
          mov rax, s_2
          push rax
          ; 76 push integer
          mov rax, 76
          push rax
          ; 76 push string
          mov rax, s_3
          push rax
          ; 76 push boolean
          mov rax, 1
          push rax
          ; 76 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 77 push integer
          mov rax, 1
          push rax
          ; 78 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 79 drop
          pop rax
          ; 81 push integer
          mov rax, 2
          push rax
          ; 82 push string
          mov rax, s_6
          push rax
          ; 83 push integer
          mov rax, 4
          push rax
          ; 84 push integer
          mov rax, 1
          push rax
          ; 85 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 86 drop
          pop rax
          ; 88 push integer
          mov rax, 2
          push rax
          ; 89 get argument
          mov rax, rbp
          add rax, 24
          mov rbx, [rax]
          push rbx
          ; 90 duplicate
          pop rax
          push rax
          push rax
          ; 90 push string
          mov rax, s_2
          push rax
          ; 90 push integer
          mov rax, 90
          push rax
          ; 90 push string
          mov rax, s_3
          push rax
          ; 90 push boolean
          mov rax, 1
          push rax
          ; 90 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 91 push integer
          mov rax, 1
          push rax
          ; 92 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 93 drop
          pop rax
          ; 95 push integer
          mov rax, 2
          push rax
          ; 96 push string
          mov rax, s_7
          push rax
          ; 97 push integer
          mov rax, 1
          push rax
          ; 98 push integer
          mov rax, 1
          push rax
          ; 99 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 100 drop
          pop rax
          ; 103 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 58 end of while-loop
          jmp while_0x0000000000000003
while_0x0000000000000003_end: 
          ; 105 push integer
          mov rax, 1
          push rax
          ; 105 push integer
          mov rax, 60
          push rax
          ; 105 syscall
          pop rax
          pop rdi
          syscall
          push rax
          ; 45 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 45 return
          ret
          ; 28 function definition
puts:     
          push rbp
          mov rbp, rsp
          ; 30 push integer
          mov rax, 1
          push rax
          ; 31 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 32 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 32 push string
          mov rax, s_8
          push rax
          ; 32 push integer
          mov rax, 32
          push rax
          ; 32 push string
          mov rax, s_9
          push rax
          ; 32 push boolean
          mov rax, 1
          push rax
          ; 32 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 33 push integer
          mov rax, 1
          push rax
          ; 34 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 29 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 29 return
          ret
          ; 37 function definition
error:    
          push rbp
          mov rbp, rsp
          ; 39 push integer
          mov rax, 2
          push rax
          ; 40 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 41 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 41 push string
          mov rax, s_8
          push rax
          ; 41 push integer
          mov rax, 41
          push rax
          ; 41 push string
          mov rax, s_10
          push rax
          ; 41 push boolean
          mov rax, 1
          push rax
          ; 41 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 42 push integer
          mov rax, 1
          push rax
          ; 43 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 38 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 38 return
          ret
          ; 46 function definition
exit:     
          push rbp
          mov rbp, rsp
          ; 48 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 48 push integer
          mov rax, 60
          push rax
          ; 48 syscall
          pop rax
          pop rdi
          syscall
          push rax
          ; 47 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 47 return
          ret
          ; 51 function definition
raise:    
          push rbp
          mov rbp, rsp
          ; 53 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 53 push string
          mov rax, s_8
          push rax
          ; 53 push integer
          mov rax, 53
          push rax
          ; 53 push string
          mov rax, s_11
          push rax
          ; 53 push boolean
          mov rax, 1
          push rax
          ; 53 call
          call traceback
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 52 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 52 return
          ret
          ; 56 function definition
assert:   
          push rbp
          mov rbp, rsp
          ; 58 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 58 push boolean
          mov rax, 0
          push rax
          ; 58 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 58 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000002
          ; 59 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 59 push string
          mov rax, s_8
          push rax
          ; 59 push integer
          mov rax, 59
          push rax
          ; 59 push string
          mov rax, s_12
          push rax
          ; 59 push boolean
          mov rax, 1
          push rax
          ; 59 call
          call traceback
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 59 jump
          jmp end_0x0000000000000002
          ; 59 label
if_0x0000000000000002: 
          ; 59 label
end_0x0000000000000002: 
          ; 57 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 57 return
          ret
          ; 62 function definition
open:     
          push rbp
          mov rbp, rsp
          ; 64 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 65 push integer
          mov rax, 0
          push rax
          ; 67 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 67 push character
          mov rax, `r`
          push rax
          ; 67 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 67 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000003
          ; 68 push integer
          mov rax, 0
          push rax
          ; 68 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 68 jump
          jmp end_0x0000000000000003
          ; 68 label
if_0x0000000000000003: 
          ; 68 label
end_0x0000000000000003: 
          ; 69 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 69 push character
          mov rax, `w`
          push rax
          ; 69 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 69 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000004
          ; 70 push integer
          mov rax, 1
          push rax
          ; 70 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 70 jump
          jmp end_0x0000000000000004
          ; 70 label
if_0x0000000000000004: 
          ; 70 label
end_0x0000000000000004: 
          ; 72 push integer
          mov rax, 0
          push rax
          ; 73 push integer
          mov rax, 2
          push rax
          ; 74 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 76 duplicate
          pop rax
          push rax
          push rax
          ; 76 push integer
          mov rax, 0
          push rax
          ; 76 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 76 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000005
          ; 77 push string
          mov rax, s_13
          push rax
          ; 77 push string
          mov rax, s_8
          push rax
          ; 77 push integer
          mov rax, 77
          push rax
          ; 77 push string
          mov rax, s_14
          push rax
          ; 77 push boolean
          mov rax, 1
          push rax
          ; 77 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 77 jump
          jmp end_0x0000000000000005
          ; 77 label
if_0x0000000000000005: 
          ; 77 label
end_0x0000000000000005: 
          ; 63 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 63 return
          ret
          ; 80 function definition
read:     
          push rbp
          mov rbp, rsp
          ; 82 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 82 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 82 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 82 push integer
          mov rax, 0
          push rax
          ; 82 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 83 duplicate
          pop rax
          push rax
          push rax
          ; 83 push integer
          mov rax, 0
          push rax
          ; 83 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 83 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000006
          ; 84 push string
          mov rax, s_15
          push rax
          ; 84 push string
          mov rax, s_8
          push rax
          ; 84 push integer
          mov rax, 84
          push rax
          ; 84 push string
          mov rax, s_16
          push rax
          ; 84 push boolean
          mov rax, 1
          push rax
          ; 84 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 84 jump
          jmp end_0x0000000000000006
          ; 84 label
if_0x0000000000000006: 
          ; 84 label
end_0x0000000000000006: 
          ; 81 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 81 return
          ret
          ; 87 function definition
rt_sigaction: 
          push rbp
          mov rbp, rsp
          ; 89 get argument
          mov rax, rbp
          add rax, 72
          mov rbx, [rax]
          push rbx
          ; 89 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 89 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 89 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 89 push integer
          mov rax, 13
          push rax
          ; 89 syscall
          pop rax
          pop r10
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 90 duplicate
          pop rax
          push rax
          push rax
          ; 90 push integer
          mov rax, 0
          push rax
          ; 90 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 90 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000007
          ; 91 push string
          mov rax, s_17
          push rax
          ; 91 push string
          mov rax, s_8
          push rax
          ; 91 push integer
          mov rax, 91
          push rax
          ; 91 push string
          mov rax, s_18
          push rax
          ; 91 push boolean
          mov rax, 1
          push rax
          ; 91 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 91 jump
          jmp end_0x0000000000000007
          ; 91 label
if_0x0000000000000007: 
          ; 91 label
end_0x0000000000000007: 
          ; 88 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 88 return
          ret
          ; 94 label
rt_sigreturn: 
          ; 96 push integer
          mov rax, 15
          push rax
          ; 96 syscall
          pop rax
          syscall
          push rax
          ; 97 push string
          mov rax, s_19
          push rax
          ; 97 push string
          mov rax, s_8
          push rax
          ; 97 push integer
          mov rax, 97
          push rax
          ; 97 push string
          mov rax, s_20
          push rax
          ; 97 push boolean
          mov rax, 1
          push rax
          ; 97 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 95 return
          ret
          ; 107 function definition
setitimer: 
          push rbp
          mov rbp, rsp
          ; 109 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 109 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 109 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 109 push integer
          mov rax, 38
          push rax
          ; 109 syscall
          pop rax
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 110 duplicate
          pop rax
          push rax
          push rax
          ; 110 push integer
          mov rax, 0
          push rax
          ; 110 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 110 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000008
          ; 111 push string
          mov rax, s_21
          push rax
          ; 111 push string
          mov rax, s_8
          push rax
          ; 111 push integer
          mov rax, 111
          push rax
          ; 111 push string
          mov rax, s_22
          push rax
          ; 111 push boolean
          mov rax, 1
          push rax
          ; 111 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 111 jump
          jmp end_0x0000000000000008
          ; 111 label
if_0x0000000000000008: 
          ; 111 label
end_0x0000000000000008: 
          ; 108 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 108 return
          ret
          ; 123 create buffer
          ; 125 function definition
setup_signal_handler: 
          push rbp
          mov rbp, rsp
          ; 127 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 127 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 127 push integer
          mov rax, 0
          push rax
          ; 127 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 127 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 128 push integer
          mov rax, 0
          push rax
          ; 128 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 128 push integer
          mov rax, 24
          push rax
          ; 128 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 128 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 130 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 130 push integer
          mov rax, 0
          push rax
          ; 130 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 130 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000009
          ; 131 push integer
          mov rax, 0
          push rax
          ; 131 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 131 push integer
          mov rax, 8
          push rax
          ; 131 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 131 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 132 push integer
          mov rax, 0
          push rax
          ; 132 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 132 push integer
          mov rax, 16
          push rax
          ; 132 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 132 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 131 jump
          jmp end_0x0000000000000009
          ; 131 label
if_0x0000000000000009: 
          ; 134 push integer
          mov rax, 4
          push rax
          ; 134 push integer
          mov rax, 67108864
          push rax
          ; 134 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 135 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 135 push integer
          mov rax, 8
          push rax
          ; 135 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 135 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 136 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 136 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 136 push integer
          mov rax, 16
          push rax
          ; 136 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 136 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 134 label
end_0x0000000000000009: 
          ; 138 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 138 get pointer to buffer
          mov rax, _sigaction
          push rax
          ; 138 push integer
          mov rax, 0
          push rax
          ; 138 push integer
          mov rax, 8
          push rax
          ; 138 push string
          mov rax, s_8
          push rax
          ; 138 push integer
          mov rax, 138
          push rax
          ; 138 push string
          mov rax, s_23
          push rax
          ; 138 push boolean
          mov rax, 1
          push rax
          ; 138 call
          call rt_sigaction
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 126 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 126 return
          ret
          ; 141 create buffer
          ; 143 function definition
set_timer: 
          push rbp
          mov rbp, rsp
          ; 145 get argument
          mov rax, rbp
          add rax, 72
          mov rbx, [rax]
          push rbx
          ; 145 get pointer to buffer
          mov rax, _itimerval
          push rax
          ; 145 push integer
          mov rax, 0
          push rax
          ; 145 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 145 push integer
          mov rax, 0
          push rax
          ; 145 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 145 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 146 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 146 get pointer to buffer
          mov rax, _itimerval
          push rax
          ; 146 push integer
          mov rax, 0
          push rax
          ; 146 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 146 push integer
          mov rax, 8
          push rax
          ; 146 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 146 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 147 get argument
          mov rax, rbp
          add rax, 72
          mov rbx, [rax]
          push rbx
          ; 147 get pointer to buffer
          mov rax, _itimerval
          push rax
          ; 147 push integer
          mov rax, 16
          push rax
          ; 147 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 147 push integer
          mov rax, 0
          push rax
          ; 147 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 147 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 148 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 148 get pointer to buffer
          mov rax, _itimerval
          push rax
          ; 148 push integer
          mov rax, 16
          push rax
          ; 148 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 148 push integer
          mov rax, 8
          push rax
          ; 148 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 148 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 150 push integer
          mov rax, 0
          push rax
          ; 150 get pointer to buffer
          mov rax, _itimerval
          push rax
          ; 150 push integer
          mov rax, 0
          push rax
          ; 150 push string
          mov rax, s_8
          push rax
          ; 150 push integer
          mov rax, 150
          push rax
          ; 150 push string
          mov rax, s_24
          push rax
          ; 150 push boolean
          mov rax, 1
          push rax
          ; 150 call
          call setitimer
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 144 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 144 return
          ret
          ; 10 function definition
NULL:     
          push rbp
          mov rbp, rsp
          ; 12 push integer
          mov rax, 0
          push rax
          ; 11 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 11 return
          ret
          ; 15 function definition
itohex:   
          push rbp
          mov rbp, rsp
          ; 17 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 18 duplicate
          pop rax
          push rax
          push rax
          ; 18 push character
          mov rax, `0`
          push rax
          ; 18 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 18 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 18 push integer
          mov rax, 1
          push rax
          ; 18 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 19 duplicate
          pop rax
          push rax
          push rax
          ; 19 push character
          mov rax, `x`
          push rax
          ; 19 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 19 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 19 push integer
          mov rax, 1
          push rax
          ; 19 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 21 push integer
          mov rax, 60
          push rax
          ; 22 label
while_0x0000000000000004: 
          ; 22 duplicate
          pop rax
          push rax
          push rax
          ; 22 push integer
          mov rax, 0
          push rax
          ; 22 is greater or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovge rax, rbx
          push rax
          ; 22 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000004_end
          ; 23 duplicate
          pop rax
          push rax
          push rax
          ; 24 push integer
          mov rax, 15
          push rax
          ; 24 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 24 shift left
          pop rcx
          pop rax
          shl rax, cl
          push rax
          ; 25 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 25 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 26 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 26 duplicate
          pop rax
          push rax
          push rax
          ; 26 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 26 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 26 shift right
          pop rcx
          pop rax
          shr rax, cl
          push rax
          ; 28 duplicate
          pop rax
          push rax
          push rax
          ; 28 push integer
          mov rax, 0
          push rax
          ; 28 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 28 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000000a
          ; 29 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 29 duplicate
          pop rax
          push rax
          push rax
          ; 29 push character
          mov rax, `0`
          push rax
          ; 29 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 29 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 29 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 29 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 29 jump
          jmp end_0x000000000000000a
          ; 29 label
if_0x000000000000000a: 
          ; 30 duplicate
          pop rax
          push rax
          push rax
          ; 30 push integer
          mov rax, 1
          push rax
          ; 30 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 30 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000000b
          ; 31 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 31 duplicate
          pop rax
          push rax
          push rax
          ; 31 push character
          mov rax, `1`
          push rax
          ; 31 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 31 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 31 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 31 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 30 jump
          jmp end_0x000000000000000a
          ; 30 label
elif_0x000000000000000b: 
          ; 32 duplicate
          pop rax
          push rax
          push rax
          ; 32 push integer
          mov rax, 2
          push rax
          ; 32 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 32 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000000c
          ; 33 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 33 duplicate
          pop rax
          push rax
          push rax
          ; 33 push character
          mov rax, `2`
          push rax
          ; 33 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 33 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 33 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 33 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 32 jump
          jmp end_0x000000000000000a
          ; 32 label
elif_0x000000000000000c: 
          ; 34 duplicate
          pop rax
          push rax
          push rax
          ; 34 push integer
          mov rax, 3
          push rax
          ; 34 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 34 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000000d
          ; 35 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 35 duplicate
          pop rax
          push rax
          push rax
          ; 35 push character
          mov rax, `3`
          push rax
          ; 35 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 35 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 35 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 35 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 34 jump
          jmp end_0x000000000000000a
          ; 34 label
elif_0x000000000000000d: 
          ; 36 duplicate
          pop rax
          push rax
          push rax
          ; 36 push integer
          mov rax, 4
          push rax
          ; 36 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 36 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000000e
          ; 37 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 37 duplicate
          pop rax
          push rax
          push rax
          ; 37 push character
          mov rax, `4`
          push rax
          ; 37 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 37 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 37 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 37 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 36 jump
          jmp end_0x000000000000000a
          ; 36 label
elif_0x000000000000000e: 
          ; 38 duplicate
          pop rax
          push rax
          push rax
          ; 38 push integer
          mov rax, 5
          push rax
          ; 38 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 38 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000000f
          ; 39 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 39 duplicate
          pop rax
          push rax
          push rax
          ; 39 push character
          mov rax, `5`
          push rax
          ; 39 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 39 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 39 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 39 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 38 jump
          jmp end_0x000000000000000a
          ; 38 label
elif_0x000000000000000f: 
          ; 40 duplicate
          pop rax
          push rax
          push rax
          ; 40 push integer
          mov rax, 6
          push rax
          ; 40 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 40 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000010
          ; 41 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 41 duplicate
          pop rax
          push rax
          push rax
          ; 41 push character
          mov rax, `6`
          push rax
          ; 41 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 41 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 41 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 41 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 40 jump
          jmp end_0x000000000000000a
          ; 40 label
elif_0x0000000000000010: 
          ; 42 duplicate
          pop rax
          push rax
          push rax
          ; 42 push integer
          mov rax, 7
          push rax
          ; 42 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 42 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000011
          ; 43 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 43 duplicate
          pop rax
          push rax
          push rax
          ; 43 push character
          mov rax, `7`
          push rax
          ; 43 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 43 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 43 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 43 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 42 jump
          jmp end_0x000000000000000a
          ; 42 label
elif_0x0000000000000011: 
          ; 44 duplicate
          pop rax
          push rax
          push rax
          ; 44 push integer
          mov rax, 8
          push rax
          ; 44 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 44 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000012
          ; 45 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 45 duplicate
          pop rax
          push rax
          push rax
          ; 45 push character
          mov rax, `8`
          push rax
          ; 45 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 45 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 45 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 45 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 44 jump
          jmp end_0x000000000000000a
          ; 44 label
elif_0x0000000000000012: 
          ; 46 duplicate
          pop rax
          push rax
          push rax
          ; 46 push integer
          mov rax, 9
          push rax
          ; 46 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 46 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000013
          ; 47 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 47 duplicate
          pop rax
          push rax
          push rax
          ; 47 push character
          mov rax, `9`
          push rax
          ; 47 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 47 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 47 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 47 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 46 jump
          jmp end_0x000000000000000a
          ; 46 label
elif_0x0000000000000013: 
          ; 48 duplicate
          pop rax
          push rax
          push rax
          ; 48 push integer
          mov rax, 10
          push rax
          ; 48 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 48 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000014
          ; 49 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 49 duplicate
          pop rax
          push rax
          push rax
          ; 49 push character
          mov rax, `a`
          push rax
          ; 49 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 49 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 49 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 49 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 48 jump
          jmp end_0x000000000000000a
          ; 48 label
elif_0x0000000000000014: 
          ; 50 duplicate
          pop rax
          push rax
          push rax
          ; 50 push integer
          mov rax, 11
          push rax
          ; 50 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 50 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000015
          ; 51 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 51 duplicate
          pop rax
          push rax
          push rax
          ; 51 push character
          mov rax, `b`
          push rax
          ; 51 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 51 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 51 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 51 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 50 jump
          jmp end_0x000000000000000a
          ; 50 label
elif_0x0000000000000015: 
          ; 52 duplicate
          pop rax
          push rax
          push rax
          ; 52 push integer
          mov rax, 12
          push rax
          ; 52 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 52 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000016
          ; 53 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 53 duplicate
          pop rax
          push rax
          push rax
          ; 53 push character
          mov rax, `c`
          push rax
          ; 53 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 53 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 53 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 53 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 52 jump
          jmp end_0x000000000000000a
          ; 52 label
elif_0x0000000000000016: 
          ; 54 duplicate
          pop rax
          push rax
          push rax
          ; 54 push integer
          mov rax, 13
          push rax
          ; 54 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 54 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000017
          ; 55 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 55 duplicate
          pop rax
          push rax
          push rax
          ; 55 push character
          mov rax, `d`
          push rax
          ; 55 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 55 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 55 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 55 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 54 jump
          jmp end_0x000000000000000a
          ; 54 label
elif_0x0000000000000017: 
          ; 56 duplicate
          pop rax
          push rax
          push rax
          ; 56 push integer
          mov rax, 14
          push rax
          ; 56 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 56 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000018
          ; 57 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 57 duplicate
          pop rax
          push rax
          push rax
          ; 57 push character
          mov rax, `e`
          push rax
          ; 57 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 57 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 57 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 57 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 56 jump
          jmp end_0x000000000000000a
          ; 56 label
elif_0x0000000000000018: 
          ; 58 duplicate
          pop rax
          push rax
          push rax
          ; 58 push integer
          mov rax, 15
          push rax
          ; 58 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 58 start of if-block
          pop rax
          test rax, rax
          jz elif_0x0000000000000019
          ; 59 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 59 duplicate
          pop rax
          push rax
          push rax
          ; 59 push character
          mov rax, `f`
          push rax
          ; 59 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 59 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 59 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 59 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 58 jump
          jmp end_0x000000000000000a
          ; 58 label
elif_0x0000000000000019: 
          ; 58 label
end_0x000000000000000a: 
          ; 60 drop
          pop rax
          ; 60 push integer
          mov rax, 4
          push rax
          ; 60 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 60 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 60 push integer
          mov rax, 1
          push rax
          ; 60 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 60 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 22 end of while-loop
          jmp while_0x0000000000000004
while_0x0000000000000004_end: 
          ; 61 drop
          pop rax
          ; 61 push integer
          mov rax, 0
          push rax
          ; 61 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 61 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 16 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 16 return
          ret
          ; 64 function definition
max:      
          push rbp
          mov rbp, rsp
          ; 66 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 66 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 66 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 66 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000001a
          ; 67 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 67 jump
          jmp end_0x000000000000001a
          ; 67 label
if_0x000000000000001a: 
          ; 69 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 69 label
end_0x000000000000001a: 
          ; 65 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 65 return
          ret
          ; 72 function definition
strcpy:   
          push rbp
          mov rbp, rsp
          ; 74 push integer
          mov rax, 0
          push rax
          ; 75 label
while_0x0000000000000005: 
          ; 75 duplicate
          pop rax
          push rax
          push rax
          ; 75 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 75 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 75 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 75 push integer
          mov rax, 0
          push rax
          ; 75 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 75 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000005_end
          ; 76 duplicate
          pop rax
          push rax
          push rax
          ; 76 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 76 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 76 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 76 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 76 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 76 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 76 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 77 push integer
          mov rax, 1
          push rax
          ; 77 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 75 end of while-loop
          jmp while_0x0000000000000005
while_0x0000000000000005_end: 
          ; 78 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 78 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 78 push integer
          mov rax, 0
          push rax
          ; 78 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 78 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 79 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 73 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 73 return
          ret
          ; 82 function definition
replace:  
          push rbp
          mov rbp, rsp
          ; 84 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 85 label
while_0x0000000000000006: 
          ; 85 duplicate
          pop rax
          push rax
          push rax
          ; 85 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 85 push integer
          mov rax, 0
          push rax
          ; 85 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 85 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000006_end
          ; 86 duplicate
          pop rax
          push rax
          push rax
          ; 86 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 86 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 86 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 86 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000001b
          ; 87 duplicate
          pop rax
          push rax
          push rax
          ; 87 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 87 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 87 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 87 jump
          jmp end_0x000000000000001b
          ; 87 label
if_0x000000000000001b: 
          ; 87 label
end_0x000000000000001b: 
          ; 88 push integer
          mov rax, 1
          push rax
          ; 88 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 85 end of while-loop
          jmp while_0x0000000000000006
while_0x0000000000000006_end: 
          ; 89 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 83 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 83 return
          ret
          ; 92 function definition
startswith: 
          push rbp
          mov rbp, rsp
          ; 94 push integer
          mov rax, 0
          push rax
          ; 95 label
while_0x0000000000000007: 
          ; 95 duplicate
          pop rax
          push rax
          push rax
          ; 95 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 95 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 95 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 95 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 95 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 95 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 95 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 95 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 95 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 95 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 95 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 95 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 95 push integer
          mov rax, 0
          push rax
          ; 95 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 95 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 95 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000007_end
          ; 96 push integer
          mov rax, 1
          push rax
          ; 96 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 95 end of while-loop
          jmp while_0x0000000000000007
while_0x0000000000000007_end: 
          ; 97 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 97 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 97 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 97 push integer
          mov rax, 0
          push rax
          ; 97 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 93 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 93 return
          ret
          ; 100 function definition
streq:    
          push rbp
          mov rbp, rsp
          ; 102 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 102 push string
          mov rax, s_25
          push rax
          ; 102 push integer
          mov rax, 102
          push rax
          ; 102 push string
          mov rax, s_26
          push rax
          ; 102 push boolean
          mov rax, 1
          push rax
          ; 102 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 102 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 102 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 102 push string
          mov rax, s_25
          push rax
          ; 102 push integer
          mov rax, 102
          push rax
          ; 102 push string
          mov rax, s_26
          push rax
          ; 102 push boolean
          mov rax, 1
          push rax
          ; 102 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 102 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 102 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 102 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000001c
          ; 103 push boolean
          mov rax, 1
          push rax
          ; 103 jump
          jmp end_0x000000000000001c
          ; 103 label
if_0x000000000000001c: 
          ; 104 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 104 push string
          mov rax, s_25
          push rax
          ; 104 push integer
          mov rax, 104
          push rax
          ; 104 push string
          mov rax, s_26
          push rax
          ; 104 push boolean
          mov rax, 1
          push rax
          ; 104 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 104 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 104 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 104 push string
          mov rax, s_25
          push rax
          ; 104 push integer
          mov rax, 104
          push rax
          ; 104 push string
          mov rax, s_26
          push rax
          ; 104 push boolean
          mov rax, 1
          push rax
          ; 104 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 104 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 104 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 104 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000001d
          ; 105 push boolean
          mov rax, 0
          push rax
          ; 104 jump
          jmp end_0x000000000000001c
          ; 104 label
elif_0x000000000000001d: 
          ; 106 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 106 push string
          mov rax, s_25
          push rax
          ; 106 push integer
          mov rax, 106
          push rax
          ; 106 push string
          mov rax, s_26
          push rax
          ; 106 push boolean
          mov rax, 1
          push rax
          ; 106 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 106 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 106 push string
          mov rax, s_25
          push rax
          ; 106 push integer
          mov rax, 106
          push rax
          ; 106 push string
          mov rax, s_26
          push rax
          ; 106 push boolean
          mov rax, 1
          push rax
          ; 106 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 106 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 106 start of if-block
          pop rax
          test rax, rax
          jz elif_0x000000000000001e
          ; 107 push boolean
          mov rax, 0
          push rax
          ; 108 push integer
          mov rax, 0
          push rax
          ; 109 label
while_0x0000000000000008: 
          ; 109 duplicate
          pop rax
          push rax
          push rax
          ; 109 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 109 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 109 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 109 push integer
          mov rax, 0
          push rax
          ; 109 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 109 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000008_end
          ; 110 duplicate
          pop rax
          push rax
          push rax
          ; 110 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 110 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 110 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 111 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 111 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 111 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 111 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 111 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 112 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 112 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 112 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 113 push integer
          mov rax, 1
          push rax
          ; 113 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 109 end of while-loop
          jmp while_0x0000000000000008
while_0x0000000000000008_end: 
          ; 114 drop
          pop rax
          ; 115 push boolean
          mov rax, 0
          push rax
          ; 115 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 106 jump
          jmp end_0x000000000000001c
          ; 106 label
elif_0x000000000000001e: 
          ; 117 push boolean
          mov rax, 0
          push rax
          ; 117 label
end_0x000000000000001c: 
          ; 101 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 101 return
          ret
          ; 137 create buffer
          ; 138 create buffer
          ; 141 create buffer
          ; 142 create buffer
          ; 144 create buffer
          ; 146 function definition
verify_memory: 
          push rbp
          mov rbp, rsp
          ; 148 get pointer to buffer
          mov rax, VERIFY_MEMORY
          push rax
          ; 148 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 148 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000001f
          ; 149 get pointer to buffer
          mov rax, DUMP_MEMORY
          push rax
          ; 149 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 149 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000020
          ; 150 push string
          mov rax, s_27
          push rax
          ; 150 push string
          mov rax, s_25
          push rax
          ; 150 push integer
          mov rax, 150
          push rax
          ; 150 push string
          mov rax, s_28
          push rax
          ; 150 push boolean
          mov rax, 1
          push rax
          ; 150 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 150 jump
          jmp end_0x0000000000000020
          ; 150 label
if_0x0000000000000020: 
          ; 150 label
end_0x0000000000000020: 
          ; 152 get pointer to buffer
          mov rax, root_page
          push rax
          ; 153 label
while_0x0000000000000009: 
          ; 153 duplicate
          pop rax
          push rax
          push rax
          ; 153 push integer
          mov rax, 0
          push rax
          ; 153 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 153 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 153 push string
          mov rax, s_25
          push rax
          ; 153 push integer
          mov rax, 153
          push rax
          ; 153 push string
          mov rax, s_28
          push rax
          ; 153 push boolean
          mov rax, 1
          push rax
          ; 153 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 153 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 153 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000009_end
          ; 154 duplicate
          pop rax
          push rax
          push rax
          ; 154 push integer
          mov rax, 0
          push rax
          ; 154 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 154 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 156 get pointer to buffer
          mov rax, DUMP_MEMORY
          push rax
          ; 156 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 156 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000021
          ; 157 push string
          mov rax, s_29
          push rax
          ; 157 push string
          mov rax, s_25
          push rax
          ; 157 push integer
          mov rax, 157
          push rax
          ; 157 push string
          mov rax, s_28
          push rax
          ; 157 push boolean
          mov rax, 1
          push rax
          ; 157 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 158 duplicate
          pop rax
          push rax
          push rax
          ; 158 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 158 push string
          mov rax, s_25
          push rax
          ; 158 push integer
          mov rax, 158
          push rax
          ; 158 push string
          mov rax, s_28
          push rax
          ; 158 push boolean
          mov rax, 1
          push rax
          ; 158 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 158 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 158 push string
          mov rax, s_25
          push rax
          ; 158 push integer
          mov rax, 158
          push rax
          ; 158 push string
          mov rax, s_28
          push rax
          ; 158 push boolean
          mov rax, 1
          push rax
          ; 158 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 159 push string
          mov rax, s_7
          push rax
          ; 159 push string
          mov rax, s_25
          push rax
          ; 159 push integer
          mov rax, 159
          push rax
          ; 159 push string
          mov rax, s_28
          push rax
          ; 159 push boolean
          mov rax, 1
          push rax
          ; 159 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 161 push string
          mov rax, s_30
          push rax
          ; 161 push string
          mov rax, s_25
          push rax
          ; 161 push integer
          mov rax, 161
          push rax
          ; 161 push string
          mov rax, s_28
          push rax
          ; 161 push boolean
          mov rax, 1
          push rax
          ; 161 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 162 duplicate
          pop rax
          push rax
          push rax
          ; 162 push integer
          mov rax, 8
          push rax
          ; 162 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 162 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 162 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 162 push string
          mov rax, s_25
          push rax
          ; 162 push integer
          mov rax, 162
          push rax
          ; 162 push string
          mov rax, s_28
          push rax
          ; 162 push boolean
          mov rax, 1
          push rax
          ; 162 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 162 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 162 push string
          mov rax, s_25
          push rax
          ; 162 push integer
          mov rax, 162
          push rax
          ; 162 push string
          mov rax, s_28
          push rax
          ; 162 push boolean
          mov rax, 1
          push rax
          ; 162 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 163 push string
          mov rax, s_7
          push rax
          ; 163 push string
          mov rax, s_25
          push rax
          ; 163 push integer
          mov rax, 163
          push rax
          ; 163 push string
          mov rax, s_28
          push rax
          ; 163 push boolean
          mov rax, 1
          push rax
          ; 163 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 165 push string
          mov rax, s_31
          push rax
          ; 165 push string
          mov rax, s_25
          push rax
          ; 165 push integer
          mov rax, 165
          push rax
          ; 165 push string
          mov rax, s_28
          push rax
          ; 165 push boolean
          mov rax, 1
          push rax
          ; 165 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 166 duplicate
          pop rax
          push rax
          push rax
          ; 166 push integer
          mov rax, 0
          push rax
          ; 166 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 166 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 166 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 166 push string
          mov rax, s_25
          push rax
          ; 166 push integer
          mov rax, 166
          push rax
          ; 166 push string
          mov rax, s_28
          push rax
          ; 166 push boolean
          mov rax, 1
          push rax
          ; 166 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 166 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 166 push string
          mov rax, s_25
          push rax
          ; 166 push integer
          mov rax, 166
          push rax
          ; 166 push string
          mov rax, s_28
          push rax
          ; 166 push boolean
          mov rax, 1
          push rax
          ; 166 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 167 push string
          mov rax, s_7
          push rax
          ; 167 push string
          mov rax, s_25
          push rax
          ; 167 push integer
          mov rax, 167
          push rax
          ; 167 push string
          mov rax, s_28
          push rax
          ; 167 push boolean
          mov rax, 1
          push rax
          ; 167 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 169 push string
          mov rax, s_32
          push rax
          ; 169 push string
          mov rax, s_25
          push rax
          ; 169 push integer
          mov rax, 169
          push rax
          ; 169 push string
          mov rax, s_28
          push rax
          ; 169 push boolean
          mov rax, 1
          push rax
          ; 169 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 170 duplicate
          pop rax
          push rax
          push rax
          ; 170 push integer
          mov rax, 16
          push rax
          ; 170 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 170 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 170 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 170 push string
          mov rax, s_25
          push rax
          ; 170 push integer
          mov rax, 170
          push rax
          ; 170 push string
          mov rax, s_28
          push rax
          ; 170 push boolean
          mov rax, 1
          push rax
          ; 170 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 170 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 170 push string
          mov rax, s_25
          push rax
          ; 170 push integer
          mov rax, 170
          push rax
          ; 170 push string
          mov rax, s_28
          push rax
          ; 170 push boolean
          mov rax, 1
          push rax
          ; 170 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 171 push string
          mov rax, s_7
          push rax
          ; 171 push string
          mov rax, s_25
          push rax
          ; 171 push integer
          mov rax, 171
          push rax
          ; 171 push string
          mov rax, s_28
          push rax
          ; 171 push boolean
          mov rax, 1
          push rax
          ; 171 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 157 jump
          jmp end_0x0000000000000021
          ; 157 label
if_0x0000000000000021: 
          ; 157 label
end_0x0000000000000021: 
          ; 173 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 173 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 173 push integer
          mov rax, 8
          push rax
          ; 173 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 173 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 173 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 174 push string
          mov rax, s_33
          push rax
          ; 174 push string
          mov rax, s_25
          push rax
          ; 174 push integer
          mov rax, 174
          push rax
          ; 174 push string
          mov rax, s_28
          push rax
          ; 174 push boolean
          mov rax, 1
          push rax
          ; 174 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 175 duplicate
          pop rax
          push rax
          push rax
          ; 175 push integer
          mov rax, 16
          push rax
          ; 175 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 175 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 175 push integer
          mov rax, 4096
          push rax
          ; 175 is greater or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovge rax, rbx
          push rax
          ; 176 push string
          mov rax, s_34
          push rax
          ; 176 push string
          mov rax, s_25
          push rax
          ; 176 push integer
          mov rax, 176
          push rax
          ; 176 push string
          mov rax, s_28
          push rax
          ; 176 push boolean
          mov rax, 1
          push rax
          ; 176 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 178 duplicate
          pop rax
          push rax
          push rax
          ; 178 push integer
          mov rax, 16
          push rax
          ; 178 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 178 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 178 push integer
          mov rax, 24
          push rax
          ; 178 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 179 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 179 push integer
          mov rax, 24
          push rax
          ; 179 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 181 duplicate
          pop rax
          push rax
          push rax
          ; 181 push integer
          mov rax, 0
          push rax
          ; 181 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 181 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 181 push string
          mov rax, s_25
          push rax
          ; 181 push integer
          mov rax, 181
          push rax
          ; 181 push string
          mov rax, s_28
          push rax
          ; 181 push boolean
          mov rax, 1
          push rax
          ; 181 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 181 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 182 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 182 push integer
          mov rax, 8
          push rax
          ; 182 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 182 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 182 push string
          mov rax, s_25
          push rax
          ; 182 push integer
          mov rax, 182
          push rax
          ; 182 push string
          mov rax, s_28
          push rax
          ; 182 push boolean
          mov rax, 1
          push rax
          ; 182 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 182 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 182 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 183 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 183 push integer
          mov rax, 24
          push rax
          ; 183 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 183 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 183 push boolean
          mov rax, 1
          push rax
          ; 183 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 183 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 183 push boolean
          mov rax, 0
          push rax
          ; 183 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 184 push string
          mov rax, s_35
          push rax
          ; 184 push string
          mov rax, s_25
          push rax
          ; 184 push integer
          mov rax, 184
          push rax
          ; 184 push string
          mov rax, s_28
          push rax
          ; 184 push boolean
          mov rax, 1
          push rax
          ; 184 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 186 label
while_0x000000000000000a: 
          ; 186 duplicate
          pop rax
          push rax
          push rax
          ; 186 push string
          mov rax, s_25
          push rax
          ; 186 push integer
          mov rax, 186
          push rax
          ; 186 push string
          mov rax, s_28
          push rax
          ; 186 push boolean
          mov rax, 1
          push rax
          ; 186 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 186 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 186 start of while-loop
          pop rax
          test rax, rax
          jz while_0x000000000000000a_end
          ; 187 get pointer to buffer
          mov rax, DUMP_MEMORY
          push rax
          ; 187 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 187 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000022
          ; 188 push string
          mov rax, s_36
          push rax
          ; 188 push string
          mov rax, s_25
          push rax
          ; 188 push integer
          mov rax, 188
          push rax
          ; 188 push string
          mov rax, s_28
          push rax
          ; 188 push boolean
          mov rax, 1
          push rax
          ; 188 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 189 duplicate
          pop rax
          push rax
          push rax
          ; 189 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 189 push string
          mov rax, s_25
          push rax
          ; 189 push integer
          mov rax, 189
          push rax
          ; 189 push string
          mov rax, s_28
          push rax
          ; 189 push boolean
          mov rax, 1
          push rax
          ; 189 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 189 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 189 push string
          mov rax, s_25
          push rax
          ; 189 push integer
          mov rax, 189
          push rax
          ; 189 push string
          mov rax, s_28
          push rax
          ; 189 push boolean
          mov rax, 1
          push rax
          ; 189 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 190 push string
          mov rax, s_7
          push rax
          ; 190 push string
          mov rax, s_25
          push rax
          ; 190 push integer
          mov rax, 190
          push rax
          ; 190 push string
          mov rax, s_28
          push rax
          ; 190 push boolean
          mov rax, 1
          push rax
          ; 190 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 192 push string
          mov rax, s_37
          push rax
          ; 192 push string
          mov rax, s_25
          push rax
          ; 192 push integer
          mov rax, 192
          push rax
          ; 192 push string
          mov rax, s_28
          push rax
          ; 192 push boolean
          mov rax, 1
          push rax
          ; 192 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 193 duplicate
          pop rax
          push rax
          push rax
          ; 193 push integer
          mov rax, 25
          push rax
          ; 193 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 193 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 193 push string
          mov rax, s_25
          push rax
          ; 193 push integer
          mov rax, 193
          push rax
          ; 193 push string
          mov rax, s_28
          push rax
          ; 193 push boolean
          mov rax, 1
          push rax
          ; 193 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 194 push string
          mov rax, s_7
          push rax
          ; 194 push string
          mov rax, s_25
          push rax
          ; 194 push integer
          mov rax, 194
          push rax
          ; 194 push string
          mov rax, s_28
          push rax
          ; 194 push boolean
          mov rax, 1
          push rax
          ; 194 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 196 push string
          mov rax, s_38
          push rax
          ; 196 push string
          mov rax, s_25
          push rax
          ; 196 push integer
          mov rax, 196
          push rax
          ; 196 push string
          mov rax, s_28
          push rax
          ; 196 push boolean
          mov rax, 1
          push rax
          ; 196 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 197 duplicate
          pop rax
          push rax
          push rax
          ; 197 push integer
          mov rax, 33
          push rax
          ; 197 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 197 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 197 push string
          mov rax, s_25
          push rax
          ; 197 push integer
          mov rax, 197
          push rax
          ; 197 push string
          mov rax, s_28
          push rax
          ; 197 push boolean
          mov rax, 1
          push rax
          ; 197 call
          call itos
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 197 push string
          mov rax, s_25
          push rax
          ; 197 push integer
          mov rax, 197
          push rax
          ; 197 push string
          mov rax, s_28
          push rax
          ; 197 push boolean
          mov rax, 1
          push rax
          ; 197 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 198 push string
          mov rax, s_7
          push rax
          ; 198 push string
          mov rax, s_25
          push rax
          ; 198 push integer
          mov rax, 198
          push rax
          ; 198 push string
          mov rax, s_28
          push rax
          ; 198 push boolean
          mov rax, 1
          push rax
          ; 198 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 200 push string
          mov rax, s_39
          push rax
          ; 200 push string
          mov rax, s_25
          push rax
          ; 200 push integer
          mov rax, 200
          push rax
          ; 200 push string
          mov rax, s_28
          push rax
          ; 200 push boolean
          mov rax, 1
          push rax
          ; 200 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 201 duplicate
          pop rax
          push rax
          push rax
          ; 201 push integer
          mov rax, 16
          push rax
          ; 201 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 201 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 201 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 201 push string
          mov rax, s_25
          push rax
          ; 201 push integer
          mov rax, 201
          push rax
          ; 201 push string
          mov rax, s_28
          push rax
          ; 201 push boolean
          mov rax, 1
          push rax
          ; 201 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 201 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 201 push string
          mov rax, s_25
          push rax
          ; 201 push integer
          mov rax, 201
          push rax
          ; 201 push string
          mov rax, s_28
          push rax
          ; 201 push boolean
          mov rax, 1
          push rax
          ; 201 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 202 push string
          mov rax, s_7
          push rax
          ; 202 push string
          mov rax, s_25
          push rax
          ; 202 push integer
          mov rax, 202
          push rax
          ; 202 push string
          mov rax, s_28
          push rax
          ; 202 push boolean
          mov rax, 1
          push rax
          ; 202 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 204 push string
          mov rax, s_40
          push rax
          ; 204 push string
          mov rax, s_25
          push rax
          ; 204 push integer
          mov rax, 204
          push rax
          ; 204 push string
          mov rax, s_28
          push rax
          ; 204 push boolean
          mov rax, 1
          push rax
          ; 204 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 205 duplicate
          pop rax
          push rax
          push rax
          ; 205 push integer
          mov rax, 0
          push rax
          ; 205 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 205 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 205 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 205 push string
          mov rax, s_25
          push rax
          ; 205 push integer
          mov rax, 205
          push rax
          ; 205 push string
          mov rax, s_28
          push rax
          ; 205 push boolean
          mov rax, 1
          push rax
          ; 205 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 205 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 205 push string
          mov rax, s_25
          push rax
          ; 205 push integer
          mov rax, 205
          push rax
          ; 205 push string
          mov rax, s_28
          push rax
          ; 205 push boolean
          mov rax, 1
          push rax
          ; 205 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 206 push string
          mov rax, s_7
          push rax
          ; 206 push string
          mov rax, s_25
          push rax
          ; 206 push integer
          mov rax, 206
          push rax
          ; 206 push string
          mov rax, s_28
          push rax
          ; 206 push boolean
          mov rax, 1
          push rax
          ; 206 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 208 push string
          mov rax, s_41
          push rax
          ; 208 push string
          mov rax, s_25
          push rax
          ; 208 push integer
          mov rax, 208
          push rax
          ; 208 push string
          mov rax, s_28
          push rax
          ; 208 push boolean
          mov rax, 1
          push rax
          ; 208 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 209 duplicate
          pop rax
          push rax
          push rax
          ; 209 push integer
          mov rax, 8
          push rax
          ; 209 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 209 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 209 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 209 push string
          mov rax, s_25
          push rax
          ; 209 push integer
          mov rax, 209
          push rax
          ; 209 push string
          mov rax, s_28
          push rax
          ; 209 push boolean
          mov rax, 1
          push rax
          ; 209 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 209 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 209 push string
          mov rax, s_25
          push rax
          ; 209 push integer
          mov rax, 209
          push rax
          ; 209 push string
          mov rax, s_28
          push rax
          ; 209 push boolean
          mov rax, 1
          push rax
          ; 209 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 210 push string
          mov rax, s_7
          push rax
          ; 210 push string
          mov rax, s_25
          push rax
          ; 210 push integer
          mov rax, 210
          push rax
          ; 210 push string
          mov rax, s_28
          push rax
          ; 210 push boolean
          mov rax, 1
          push rax
          ; 210 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 212 push string
          mov rax, s_42
          push rax
          ; 212 push string
          mov rax, s_25
          push rax
          ; 212 push integer
          mov rax, 212
          push rax
          ; 212 push string
          mov rax, s_28
          push rax
          ; 212 push boolean
          mov rax, 1
          push rax
          ; 212 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 213 duplicate
          pop rax
          push rax
          push rax
          ; 213 push integer
          mov rax, 24
          push rax
          ; 213 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 213 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 213 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000023
          ; 214 push string
          mov rax, s_43
          push rax
          ; 214 push string
          mov rax, s_25
          push rax
          ; 214 push integer
          mov rax, 214
          push rax
          ; 214 push string
          mov rax, s_28
          push rax
          ; 214 push boolean
          mov rax, 1
          push rax
          ; 214 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 214 jump
          jmp end_0x0000000000000023
          ; 214 label
if_0x0000000000000023: 
          ; 216 push string
          mov rax, s_44
          push rax
          ; 216 push string
          mov rax, s_25
          push rax
          ; 216 push integer
          mov rax, 216
          push rax
          ; 216 push string
          mov rax, s_28
          push rax
          ; 216 push boolean
          mov rax, 1
          push rax
          ; 216 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 216 label
end_0x0000000000000023: 
          ; 188 jump
          jmp end_0x0000000000000022
          ; 188 label
if_0x0000000000000022: 
          ; 188 label
end_0x0000000000000022: 
          ; 218 duplicate
          pop rax
          push rax
          push rax
          ; 218 push integer
          mov rax, 16
          push rax
          ; 218 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 218 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 218 push integer
          mov rax, 41
          push rax
          ; 218 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 219 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 219 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 219 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 220 duplicate
          pop rax
          push rax
          push rax
          ; 220 push integer
          mov rax, 0
          push rax
          ; 220 is greater or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovge rax, rbx
          push rax
          ; 220 push string
          mov rax, s_45
          push rax
          ; 220 push string
          mov rax, s_25
          push rax
          ; 220 push integer
          mov rax, 220
          push rax
          ; 220 push string
          mov rax, s_28
          push rax
          ; 220 push boolean
          mov rax, 1
          push rax
          ; 220 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 221 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 223 duplicate
          pop rax
          push rax
          push rax
          ; 223 push integer
          mov rax, 0
          push rax
          ; 223 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 223 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 223 push string
          mov rax, s_25
          push rax
          ; 223 push integer
          mov rax, 223
          push rax
          ; 223 push string
          mov rax, s_28
          push rax
          ; 223 push boolean
          mov rax, 1
          push rax
          ; 223 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 223 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 224 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 224 duplicate
          pop rax
          push rax
          push rax
          ; 224 push integer
          mov rax, 0
          push rax
          ; 224 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 224 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 224 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 224 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 224 push integer
          mov rax, 4096
          push rax
          ; 224 is less or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovle rax, rbx
          push rax
          ; 224 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 225 push string
          mov rax, s_46
          push rax
          ; 225 push string
          mov rax, s_25
          push rax
          ; 225 push integer
          mov rax, 225
          push rax
          ; 225 push string
          mov rax, s_28
          push rax
          ; 225 push boolean
          mov rax, 1
          push rax
          ; 225 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 227 duplicate
          pop rax
          push rax
          push rax
          ; 227 push integer
          mov rax, 8
          push rax
          ; 227 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 227 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 227 push string
          mov rax, s_25
          push rax
          ; 227 push integer
          mov rax, 227
          push rax
          ; 227 push string
          mov rax, s_28
          push rax
          ; 227 push boolean
          mov rax, 1
          push rax
          ; 227 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 227 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 228 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 228 duplicate
          pop rax
          push rax
          push rax
          ; 228 push integer
          mov rax, 8
          push rax
          ; 228 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 228 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 228 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 228 push integer
          mov rax, 4096
          push rax
          ; 228 is less or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovle rax, rbx
          push rax
          ; 228 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 229 push string
          mov rax, s_47
          push rax
          ; 229 push string
          mov rax, s_25
          push rax
          ; 229 push integer
          mov rax, 229
          push rax
          ; 229 push string
          mov rax, s_28
          push rax
          ; 229 push boolean
          mov rax, 1
          push rax
          ; 229 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 231 duplicate
          pop rax
          push rax
          push rax
          ; 231 push integer
          mov rax, 0
          push rax
          ; 231 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 231 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 231 push string
          mov rax, s_25
          push rax
          ; 231 push integer
          mov rax, 231
          push rax
          ; 231 push string
          mov rax, s_28
          push rax
          ; 231 push boolean
          mov rax, 1
          push rax
          ; 231 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 231 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 231 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000024
          ; 232 duplicate
          pop rax
          push rax
          push rax
          ; 232 push integer
          mov rax, 0
          push rax
          ; 232 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 232 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 233 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 233 push integer
          mov rax, 16
          push rax
          ; 233 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 233 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 233 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 234 push integer
          mov rax, 41
          push rax
          ; 234 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 235 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 235 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 235 push string
          mov rax, s_48
          push rax
          ; 235 push string
          mov rax, s_25
          push rax
          ; 235 push integer
          mov rax, 235
          push rax
          ; 235 push string
          mov rax, s_28
          push rax
          ; 235 push boolean
          mov rax, 1
          push rax
          ; 235 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 232 jump
          jmp end_0x0000000000000024
          ; 232 label
if_0x0000000000000024: 
          ; 232 label
end_0x0000000000000024: 
          ; 237 duplicate
          pop rax
          push rax
          push rax
          ; 237 push integer
          mov rax, 8
          push rax
          ; 237 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 237 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 237 push string
          mov rax, s_25
          push rax
          ; 237 push integer
          mov rax, 237
          push rax
          ; 237 push string
          mov rax, s_28
          push rax
          ; 237 push boolean
          mov rax, 1
          push rax
          ; 237 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 237 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 237 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000025
          ; 238 duplicate
          pop rax
          push rax
          push rax
          ; 238 push integer
          mov rax, 8
          push rax
          ; 238 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 238 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 239 duplicate
          pop rax
          push rax
          push rax
          ; 239 push integer
          mov rax, 16
          push rax
          ; 239 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 239 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 239 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 240 push integer
          mov rax, 41
          push rax
          ; 240 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 241 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 241 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 241 push string
          mov rax, s_49
          push rax
          ; 241 push string
          mov rax, s_25
          push rax
          ; 241 push integer
          mov rax, 241
          push rax
          ; 241 push string
          mov rax, s_28
          push rax
          ; 241 push boolean
          mov rax, 1
          push rax
          ; 241 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 238 jump
          jmp end_0x0000000000000025
          ; 238 label
if_0x0000000000000025: 
          ; 238 label
end_0x0000000000000025: 
          ; 243 push integer
          mov rax, 0
          push rax
          ; 243 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 243 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 186 end of while-loop
          jmp while_0x000000000000000a
while_0x000000000000000a_end: 
          ; 244 drop
          pop rax
          ; 246 duplicate
          pop rax
          push rax
          push rax
          ; 246 push integer
          mov rax, 0
          push rax
          ; 246 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 246 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000026
          ; 247 get pointer to buffer
          mov rax, DUMP_MEMORY
          push rax
          ; 247 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 247 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000027
          ; 248 push string
          mov rax, s_50
          push rax
          ; 248 push string
          mov rax, s_25
          push rax
          ; 248 push integer
          mov rax, 248
          push rax
          ; 248 push string
          mov rax, s_28
          push rax
          ; 248 push boolean
          mov rax, 1
          push rax
          ; 248 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 249 duplicate
          pop rax
          push rax
          push rax
          ; 249 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 249 push string
          mov rax, s_25
          push rax
          ; 249 push integer
          mov rax, 249
          push rax
          ; 249 push string
          mov rax, s_28
          push rax
          ; 249 push boolean
          mov rax, 1
          push rax
          ; 249 call
          call itohex
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 249 get pointer to buffer
          mov rax, _vm_buf
          push rax
          ; 249 push string
          mov rax, s_25
          push rax
          ; 249 push integer
          mov rax, 249
          push rax
          ; 249 push string
          mov rax, s_28
          push rax
          ; 249 push boolean
          mov rax, 1
          push rax
          ; 249 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 250 push string
          mov rax, s_7
          push rax
          ; 250 push string
          mov rax, s_25
          push rax
          ; 250 push integer
          mov rax, 250
          push rax
          ; 250 push string
          mov rax, s_28
          push rax
          ; 250 push boolean
          mov rax, 1
          push rax
          ; 250 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 248 jump
          jmp end_0x0000000000000027
          ; 248 label
if_0x0000000000000027: 
          ; 248 label
end_0x0000000000000027: 
          ; 251 push boolean
          mov rax, 0
          push rax
          ; 251 push string
          mov rax, s_51
          push rax
          ; 251 push string
          mov rax, s_25
          push rax
          ; 251 push integer
          mov rax, 251
          push rax
          ; 251 push string
          mov rax, s_28
          push rax
          ; 251 push boolean
          mov rax, 1
          push rax
          ; 251 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 247 jump
          jmp end_0x0000000000000026
          ; 247 label
if_0x0000000000000026: 
          ; 247 label
end_0x0000000000000026: 
          ; 252 drop
          pop rax
          ; 153 end of while-loop
          jmp while_0x0000000000000009
while_0x0000000000000009_end: 
          ; 254 drop
          pop rax
          ; 255 get pointer to buffer
          mov rax, DUMP_MEMORY
          push rax
          ; 255 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 255 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000028
          ; 256 push string
          mov rax, s_52
          push rax
          ; 256 push string
          mov rax, s_25
          push rax
          ; 256 push integer
          mov rax, 256
          push rax
          ; 256 push string
          mov rax, s_28
          push rax
          ; 256 push boolean
          mov rax, 1
          push rax
          ; 256 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 256 jump
          jmp end_0x0000000000000028
          ; 256 label
if_0x0000000000000028: 
          ; 256 label
end_0x0000000000000028: 
          ; 149 jump
          jmp end_0x000000000000001f
          ; 149 label
if_0x000000000000001f: 
          ; 149 label
end_0x000000000000001f: 
          ; 147 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 147 return
          ret
          ; 259 function definition
_malloc_get_next_page: 
          push rbp
          mov rbp, rsp
          ; 261 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 261 push integer
          mov rax, 4096
          push rax
          ; 261 is greater or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovge rax, rbx
          push rax
          ; 261 push string
          mov rax, s_53
          push rax
          ; 261 push string
          mov rax, s_25
          push rax
          ; 261 push integer
          mov rax, 261
          push rax
          ; 261 push string
          mov rax, s_54
          push rax
          ; 261 push boolean
          mov rax, 1
          push rax
          ; 261 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 263 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 263 push integer
          mov rax, 0
          push rax
          ; 263 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 263 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 263 push string
          mov rax, s_25
          push rax
          ; 263 push integer
          mov rax, 263
          push rax
          ; 263 push string
          mov rax, s_54
          push rax
          ; 263 push boolean
          mov rax, 1
          push rax
          ; 263 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 263 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 263 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000029
          ; 264 push string
          mov rax, s_25
          push rax
          ; 264 push integer
          mov rax, 264
          push rax
          ; 264 push string
          mov rax, s_54
          push rax
          ; 264 push boolean
          mov rax, 1
          push rax
          ; 264 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 265 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 266 push integer
          mov rax, 1
          push rax
          ; 266 push integer
          mov rax, 2
          push rax
          ; 266 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 267 push integer
          mov rax, 2
          push rax
          ; 267 push integer
          mov rax, 32
          push rax
          ; 267 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 268 push integer
          mov rax, 0
          push rax
          ; 268 push integer
          mov rax, 1
          push rax
          ; 268 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 269 push integer
          mov rax, 0
          push rax
          ; 270 push integer
          mov rax, 9
          push rax
          ; 271 syscall
          pop rax
          pop r9
          pop r8
          pop r10
          pop rdx
          pop rsi
          pop rdi
          syscall
          push rax
          ; 273 duplicate
          pop rax
          push rax
          push rax
          ; 273 push integer
          mov rax, 0
          push rax
          ; 273 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 273 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000002a
          ; 274 push string
          mov rax, s_55
          push rax
          ; 274 push string
          mov rax, s_25
          push rax
          ; 274 push integer
          mov rax, 274
          push rax
          ; 274 push string
          mov rax, s_54
          push rax
          ; 274 push boolean
          mov rax, 1
          push rax
          ; 274 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 274 jump
          jmp end_0x000000000000002a
          ; 274 label
if_0x000000000000002a: 
          ; 274 label
end_0x000000000000002a: 
          ; 279 duplicate
          pop rax
          push rax
          push rax
          ; 279 push integer
          mov rax, 0
          push rax
          ; 279 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 279 push string
          mov rax, s_25
          push rax
          ; 279 push integer
          mov rax, 279
          push rax
          ; 279 push string
          mov rax, s_54
          push rax
          ; 279 push boolean
          mov rax, 1
          push rax
          ; 279 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 279 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 279 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 280 duplicate
          pop rax
          push rax
          push rax
          ; 280 push integer
          mov rax, 8
          push rax
          ; 280 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 280 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 280 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 280 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 281 duplicate
          pop rax
          push rax
          push rax
          ; 281 push integer
          mov rax, 16
          push rax
          ; 281 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 281 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 281 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 281 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 284 duplicate
          pop rax
          push rax
          push rax
          ; 284 push integer
          mov rax, 24
          push rax
          ; 284 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 285 duplicate
          pop rax
          push rax
          push rax
          ; 285 push integer
          mov rax, 24
          push rax
          ; 285 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 285 push boolean
          mov rax, 1
          push rax
          ; 285 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 285 set boolean value
          pop rax
          pop rbx
          mov [rax], bl
          ; 286 duplicate
          pop rax
          push rax
          push rax
          ; 286 push integer
          mov rax, 0
          push rax
          ; 286 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 286 push string
          mov rax, s_25
          push rax
          ; 286 push integer
          mov rax, 286
          push rax
          ; 286 push string
          mov rax, s_54
          push rax
          ; 286 push boolean
          mov rax, 1
          push rax
          ; 286 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 286 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 286 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 287 duplicate
          pop rax
          push rax
          push rax
          ; 287 push integer
          mov rax, 8
          push rax
          ; 287 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 287 push string
          mov rax, s_25
          push rax
          ; 287 push integer
          mov rax, 287
          push rax
          ; 287 push string
          mov rax, s_54
          push rax
          ; 287 push boolean
          mov rax, 1
          push rax
          ; 287 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 287 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 287 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 288 duplicate
          pop rax
          push rax
          push rax
          ; 288 push integer
          mov rax, 25
          push rax
          ; 288 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 288 push string
          mov rax, s_56
          push rax
          ; 288 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 288 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 289 duplicate
          pop rax
          push rax
          push rax
          ; 289 push integer
          mov rax, 33
          push rax
          ; 289 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 289 push integer
          mov rax, 0
          push rax
          ; 289 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 289 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 290 duplicate
          pop rax
          push rax
          push rax
          ; 290 push integer
          mov rax, 16
          push rax
          ; 290 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 290 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 290 push integer
          mov rax, 24
          push rax
          ; 290 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 291 push integer
          mov rax, 41
          push rax
          ; 291 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 291 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 291 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 292 drop
          pop rax
          ; 294 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 294 push integer
          mov rax, 0
          push rax
          ; 294 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 294 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 264 jump
          jmp end_0x0000000000000029
          ; 264 label
if_0x0000000000000029: 
          ; 264 label
end_0x0000000000000029: 
          ; 297 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 297 push integer
          mov rax, 0
          push rax
          ; 297 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 297 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 299 duplicate
          pop rax
          push rax
          push rax
          ; 299 push string
          mov rax, s_25
          push rax
          ; 299 push integer
          mov rax, 299
          push rax
          ; 299 push string
          mov rax, s_54
          push rax
          ; 299 push boolean
          mov rax, 1
          push rax
          ; 299 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 299 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 299 push string
          mov rax, s_57
          push rax
          ; 299 push string
          mov rax, s_25
          push rax
          ; 299 push integer
          mov rax, 299
          push rax
          ; 299 push string
          mov rax, s_54
          push rax
          ; 299 push boolean
          mov rax, 1
          push rax
          ; 299 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 260 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 260 return
          ret
          ; 302 function definition
_malloc_split_block: 
          push rbp
          mov rbp, rsp
          ; 305 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 305 push integer
          mov rax, 24
          push rax
          ; 305 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 305 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 305 push string
          mov rax, s_58
          push rax
          ; 305 push string
          mov rax, s_25
          push rax
          ; 305 push integer
          mov rax, 305
          push rax
          ; 305 push string
          mov rax, s_59
          push rax
          ; 305 push boolean
          mov rax, 1
          push rax
          ; 305 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 307 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 307 push integer
          mov rax, 0
          push rax
          ; 307 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 307 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 309 push boolean
          mov rax, 0
          push rax
          ; 309 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 309 push integer
          mov rax, 24
          push rax
          ; 309 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 309 set boolean value
          pop rax
          pop rbx
          mov [rax], bl
          ; 312 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 312 push integer
          mov rax, 41
          push rax
          ; 312 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 312 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 312 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 314 duplicate
          pop rax
          push rax
          push rax
          ; 314 push integer
          mov rax, 0
          push rax
          ; 314 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 314 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000002b
          ; 316 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 316 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 316 push integer
          mov rax, 16
          push rax
          ; 316 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 316 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 318 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 318 push integer
          mov rax, 41
          push rax
          ; 318 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 318 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 318 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 318 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 318 push integer
          mov rax, 0
          push rax
          ; 318 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 318 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 320 push boolean
          mov rax, 1
          push rax
          ; 320 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 320 push integer
          mov rax, 0
          push rax
          ; 320 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 320 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 320 push integer
          mov rax, 24
          push rax
          ; 320 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 320 set boolean value
          pop rax
          pop rbx
          mov [rax], bl
          ; 321 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 321 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 321 push integer
          mov rax, 0
          push rax
          ; 321 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 321 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 321 push integer
          mov rax, 8
          push rax
          ; 321 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 321 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 322 duplicate
          pop rax
          push rax
          push rax
          ; 322 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 322 push integer
          mov rax, 0
          push rax
          ; 322 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 322 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 322 push integer
          mov rax, 16
          push rax
          ; 322 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 322 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 323 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 323 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 323 push integer
          mov rax, 0
          push rax
          ; 323 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 323 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 323 push integer
          mov rax, 0
          push rax
          ; 323 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 323 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 324 push string
          mov rax, s_56
          push rax
          ; 324 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 324 push integer
          mov rax, 0
          push rax
          ; 324 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 324 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 324 push integer
          mov rax, 25
          push rax
          ; 324 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 324 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 325 push integer
          mov rax, 0
          push rax
          ; 325 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 325 push integer
          mov rax, 0
          push rax
          ; 325 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 325 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 325 push integer
          mov rax, 33
          push rax
          ; 325 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 325 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 327 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 327 push integer
          mov rax, 0
          push rax
          ; 327 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 327 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 327 push integer
          mov rax, 0
          push rax
          ; 327 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 327 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 327 push string
          mov rax, s_25
          push rax
          ; 327 push integer
          mov rax, 327
          push rax
          ; 327 push string
          mov rax, s_59
          push rax
          ; 327 push boolean
          mov rax, 1
          push rax
          ; 327 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 327 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 327 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000002c
          ; 328 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 328 push integer
          mov rax, 0
          push rax
          ; 328 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 328 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 328 duplicate
          pop rax
          push rax
          push rax
          ; 328 push integer
          mov rax, 0
          push rax
          ; 328 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 328 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 328 push integer
          mov rax, 8
          push rax
          ; 328 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 328 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 328 jump
          jmp end_0x000000000000002c
          ; 328 label
if_0x000000000000002c: 
          ; 328 label
end_0x000000000000002c: 
          ; 315 jump
          jmp end_0x000000000000002b
          ; 315 label
if_0x000000000000002b: 
          ; 315 label
end_0x000000000000002b: 
          ; 330 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 303 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 303 return
          ret
          ; 333 function definition
_malloc_block_is_available_or_NULL: 
          push rbp
          mov rbp, rsp
          ; 335 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 335 push string
          mov rax, s_25
          push rax
          ; 335 push integer
          mov rax, 335
          push rax
          ; 335 push string
          mov rax, s_60
          push rax
          ; 335 push boolean
          mov rax, 1
          push rax
          ; 335 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 335 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 335 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000002d
          ; 336 push boolean
          mov rax, 1
          push rax
          ; 336 jump
          jmp end_0x000000000000002d
          ; 336 label
if_0x000000000000002d: 
          ; 338 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 338 push integer
          mov rax, 24
          push rax
          ; 338 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 338 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 339 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 339 push integer
          mov rax, 16
          push rax
          ; 339 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 339 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 339 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 339 is greater or equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovge rax, rbx
          push rax
          ; 339 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 338 label
end_0x000000000000002d: 
          ; 334 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 334 return
          ret
          ; 342 function definition
malloc:   
          push rbp
          mov rbp, rsp
          ; 346 get pointer to buffer
          mov rax, current_page
          push rax
          ; 346 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 346 push string
          mov rax, s_25
          push rax
          ; 346 push integer
          mov rax, 346
          push rax
          ; 346 push string
          mov rax, s_61
          push rax
          ; 346 push boolean
          mov rax, 1
          push rax
          ; 346 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 346 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 346 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000002e
          ; 347 get pointer to buffer
          mov rax, root_page
          push rax
          ; 347 get pointer to buffer
          mov rax, current_page
          push rax
          ; 347 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 347 jump
          jmp end_0x000000000000002e
          ; 347 label
if_0x000000000000002e: 
          ; 347 label
end_0x000000000000002e: 
          ; 349 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 349 push integer
          mov rax, 0
          push rax
          ; 349 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 349 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000002f
          ; 350 push string
          mov rax, s_62
          push rax
          ; 350 push string
          mov rax, s_25
          push rax
          ; 350 push integer
          mov rax, 350
          push rax
          ; 350 push string
          mov rax, s_61
          push rax
          ; 350 push boolean
          mov rax, 1
          push rax
          ; 350 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 350 jump
          jmp end_0x000000000000002f
          ; 350 label
if_0x000000000000002f: 
          ; 350 label
end_0x000000000000002f: 
          ; 353 push string
          mov rax, s_25
          push rax
          ; 353 push integer
          mov rax, 353
          push rax
          ; 353 push string
          mov rax, s_61
          push rax
          ; 353 push boolean
          mov rax, 1
          push rax
          ; 353 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 354 label
while_0x000000000000000b: 
          ; 354 duplicate
          pop rax
          push rax
          push rax
          ; 354 push string
          mov rax, s_25
          push rax
          ; 354 push integer
          mov rax, 354
          push rax
          ; 354 push string
          mov rax, s_61
          push rax
          ; 354 push boolean
          mov rax, 1
          push rax
          ; 354 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 354 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 354 start of while-loop
          pop rax
          test rax, rax
          jz while_0x000000000000000b_end
          ; 355 drop
          pop rax
          ; 358 get pointer to buffer
          mov rax, current_page
          push rax
          ; 358 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 359 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 359 push integer
          mov rax, 24
          push rax
          ; 359 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 359 push integer
          mov rax, 41
          push rax
          ; 359 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 360 push integer
          mov rax, 4096
          push rax
          ; 360 push string
          mov rax, s_25
          push rax
          ; 360 push integer
          mov rax, 360
          push rax
          ; 360 push string
          mov rax, s_61
          push rax
          ; 360 push boolean
          mov rax, 1
          push rax
          ; 360 call
          call max
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 360 push string
          mov rax, s_25
          push rax
          ; 360 push integer
          mov rax, 360
          push rax
          ; 360 push string
          mov rax, s_61
          push rax
          ; 360 push boolean
          mov rax, 1
          push rax
          ; 360 call
          call _malloc_get_next_page
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 361 duplicate
          pop rax
          push rax
          push rax
          ; 361 get pointer to buffer
          mov rax, current_page
          push rax
          ; 361 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 363 get pointer to buffer
          mov rax, root_page
          push rax
          ; 363 push integer
          mov rax, 0
          push rax
          ; 363 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 363 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 363 push string
          mov rax, s_25
          push rax
          ; 363 push integer
          mov rax, 363
          push rax
          ; 363 push string
          mov rax, s_61
          push rax
          ; 363 push boolean
          mov rax, 1
          push rax
          ; 363 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 363 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 363 push string
          mov rax, s_63
          push rax
          ; 363 push string
          mov rax, s_25
          push rax
          ; 363 push integer
          mov rax, 363
          push rax
          ; 363 push string
          mov rax, s_61
          push rax
          ; 363 push boolean
          mov rax, 1
          push rax
          ; 363 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 364 duplicate
          pop rax
          push rax
          push rax
          ; 364 get pointer to buffer
          mov rax, root_page
          push rax
          ; 364 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 364 push string
          mov rax, s_64
          push rax
          ; 364 push string
          mov rax, s_25
          push rax
          ; 364 push integer
          mov rax, 364
          push rax
          ; 364 push string
          mov rax, s_61
          push rax
          ; 364 push boolean
          mov rax, 1
          push rax
          ; 364 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 365 duplicate
          pop rax
          push rax
          push rax
          ; 365 push string
          mov rax, s_25
          push rax
          ; 365 push integer
          mov rax, 365
          push rax
          ; 365 push string
          mov rax, s_61
          push rax
          ; 365 push boolean
          mov rax, 1
          push rax
          ; 365 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 365 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 365 push string
          mov rax, s_65
          push rax
          ; 365 push string
          mov rax, s_25
          push rax
          ; 365 push integer
          mov rax, 365
          push rax
          ; 365 push string
          mov rax, s_61
          push rax
          ; 365 push boolean
          mov rax, 1
          push rax
          ; 365 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 368 push integer
          mov rax, 24
          push rax
          ; 368 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 370 duplicate
          pop rax
          push rax
          push rax
          ; 370 push integer
          mov rax, 16
          push rax
          ; 370 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 370 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 370 push integer
          mov rax, 0
          push rax
          ; 370 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 370 push string
          mov rax, s_66
          push rax
          ; 370 push string
          mov rax, s_25
          push rax
          ; 370 push integer
          mov rax, 370
          push rax
          ; 370 push string
          mov rax, s_61
          push rax
          ; 370 push boolean
          mov rax, 1
          push rax
          ; 370 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 373 label
while_0x000000000000000c: 
          ; 373 duplicate
          pop rax
          push rax
          push rax
          ; 373 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 373 push string
          mov rax, s_25
          push rax
          ; 373 push integer
          mov rax, 373
          push rax
          ; 373 push string
          mov rax, s_61
          push rax
          ; 373 push boolean
          mov rax, 1
          push rax
          ; 373 call
          call _malloc_block_is_available_or_NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 373 push boolean
          mov rax, 0
          push rax
          ; 373 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 373 start of while-loop
          pop rax
          test rax, rax
          jz while_0x000000000000000c_end
          ; 374 push integer
          mov rax, 0
          push rax
          ; 374 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 374 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 373 end of while-loop
          jmp while_0x000000000000000c
while_0x000000000000000c_end: 
          ; 354 end of while-loop
          jmp while_0x000000000000000b
while_0x000000000000000b_end: 
          ; 376 duplicate
          pop rax
          push rax
          push rax
          ; 376 push string
          mov rax, s_25
          push rax
          ; 376 push integer
          mov rax, 376
          push rax
          ; 376 push string
          mov rax, s_61
          push rax
          ; 376 push boolean
          mov rax, 1
          push rax
          ; 376 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 376 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 376 push string
          mov rax, s_67
          push rax
          ; 376 push string
          mov rax, s_25
          push rax
          ; 376 push integer
          mov rax, 376
          push rax
          ; 376 push string
          mov rax, s_61
          push rax
          ; 376 push boolean
          mov rax, 1
          push rax
          ; 376 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 377 duplicate
          pop rax
          push rax
          push rax
          ; 377 push integer
          mov rax, 24
          push rax
          ; 377 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 377 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 377 push string
          mov rax, s_68
          push rax
          ; 377 push string
          mov rax, s_25
          push rax
          ; 377 push integer
          mov rax, 377
          push rax
          ; 377 push string
          mov rax, s_61
          push rax
          ; 377 push boolean
          mov rax, 1
          push rax
          ; 377 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 379 get pointer to buffer
          mov rax, DUMP_MEMORY
          push rax
          ; 379 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 379 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000030
          ; 380 get argument
          mov rax, rbp
          add rax, 16
          mov rbx, [rax]
          push rbx
          ; 380 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000031
          ; 382 get argument
          mov rax, rbp
          add rax, 40
          mov rbx, [rax]
          push rbx
          ; 383 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 383 push integer
          mov rax, 25
          push rax
          ; 383 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 383 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 386 get argument
          mov rax, rbp
          add rax, 32
          mov rbx, [rax]
          push rbx
          ; 387 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 387 push integer
          mov rax, 33
          push rax
          ; 387 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 387 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 381 jump
          jmp end_0x0000000000000031
          ; 381 label
if_0x0000000000000031: 
          ; 381 label
end_0x0000000000000031: 
          ; 380 jump
          jmp end_0x0000000000000030
          ; 380 label
if_0x0000000000000030: 
          ; 380 label
end_0x0000000000000030: 
          ; 389 duplicate
          pop rax
          push rax
          push rax
          ; 389 push integer
          mov rax, 16
          push rax
          ; 389 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 389 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 389 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 389 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 389 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000032
          ; 391 duplicate
          pop rax
          push rax
          push rax
          ; 391 push integer
          mov rax, 24
          push rax
          ; 391 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 391 push boolean
          mov rax, 0
          push rax
          ; 391 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 391 set boolean value
          pop rax
          pop rbx
          mov [rax], bl
          ; 390 jump
          jmp end_0x0000000000000032
          ; 390 label
if_0x0000000000000032: 
          ; 394 duplicate
          pop rax
          push rax
          push rax
          ; 394 push integer
          mov rax, 16
          push rax
          ; 394 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 394 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 394 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 394 push string
          mov rax, s_25
          push rax
          ; 394 push integer
          mov rax, 394
          push rax
          ; 394 push string
          mov rax, s_61
          push rax
          ; 394 push boolean
          mov rax, 1
          push rax
          ; 394 call
          call _malloc_split_block
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 393 label
end_0x0000000000000032: 
          ; 397 get pointer to buffer
          mov rax, current_page
          push rax
          ; 397 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 397 push integer
          mov rax, 0
          push rax
          ; 397 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 397 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 397 push string
          mov rax, s_25
          push rax
          ; 397 push integer
          mov rax, 397
          push rax
          ; 397 push string
          mov rax, s_61
          push rax
          ; 397 push boolean
          mov rax, 1
          push rax
          ; 397 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 397 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 397 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000033
          ; 398 get pointer to buffer
          mov rax, root_page
          push rax
          ; 398 get pointer to buffer
          mov rax, current_page
          push rax
          ; 398 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 398 jump
          jmp end_0x0000000000000033
          ; 398 label
if_0x0000000000000033: 
          ; 400 get pointer to buffer
          mov rax, current_page
          push rax
          ; 400 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 400 push integer
          mov rax, 8
          push rax
          ; 400 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 400 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 400 get pointer to buffer
          mov rax, current_page
          push rax
          ; 400 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 400 label
end_0x0000000000000033: 
          ; 402 push integer
          mov rax, 41
          push rax
          ; 402 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 403 push string
          mov rax, s_25
          push rax
          ; 403 push integer
          mov rax, 403
          push rax
          ; 403 push string
          mov rax, s_61
          push rax
          ; 403 push boolean
          mov rax, 1
          push rax
          ; 403 call
          call verify_memory
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 343 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 343 return
          ret
          ; 406 function definition
zalloc:   
          push rbp
          mov rbp, rsp
          ; 408 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 408 push string
          mov rax, s_25
          push rax
          ; 408 push integer
          mov rax, 408
          push rax
          ; 408 push string
          mov rax, s_69
          push rax
          ; 408 push boolean
          mov rax, 1
          push rax
          ; 408 call
          call malloc
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 409 push integer
          mov rax, 0
          push rax
          ; 410 label
while_0x000000000000000d: 
          ; 410 duplicate
          pop rax
          push rax
          push rax
          ; 410 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 410 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 410 start of while-loop
          pop rax
          test rax, rax
          jz while_0x000000000000000d_end
          ; 411 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 411 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 411 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 411 push integer
          mov rax, 0
          push rax
          ; 411 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 411 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 412 push integer
          mov rax, 1
          push rax
          ; 412 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 410 end of while-loop
          jmp while_0x000000000000000d
while_0x000000000000000d_end: 
          ; 413 drop
          pop rax
          ; 407 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 407 return
          ret
          ; 416 function definition
memcpy:   
          push rbp
          mov rbp, rsp
          ; 418 push integer
          mov rax, 0
          push rax
          ; 419 label
while_0x000000000000000e: 
          ; 419 duplicate
          pop rax
          push rax
          push rax
          ; 419 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 419 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 419 start of while-loop
          pop rax
          test rax, rax
          jz while_0x000000000000000e_end
          ; 420 duplicate
          pop rax
          push rax
          push rax
          ; 420 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 420 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 420 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 421 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 421 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 421 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 421 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 422 push integer
          mov rax, 1
          push rax
          ; 422 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 419 end of while-loop
          jmp while_0x000000000000000e
while_0x000000000000000e_end: 
          ; 423 push string
          mov rax, s_25
          push rax
          ; 423 push integer
          mov rax, 423
          push rax
          ; 423 push string
          mov rax, s_70
          push rax
          ; 423 push boolean
          mov rax, 1
          push rax
          ; 423 call
          call verify_memory
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 417 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 417 return
          ret
          ; 426 function definition
merge_blocks: 
          push rbp
          mov rbp, rsp
          ; 429 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 429 push integer
          mov rax, 24
          push rax
          ; 429 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 429 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 429 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 429 push integer
          mov rax, 24
          push rax
          ; 429 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 429 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 429 bitwise and
          pop rax
          pop rbx
          and rbx, rax
          push rbx
          ; 429 push string
          mov rax, s_71
          push rax
          ; 429 push string
          mov rax, s_25
          push rax
          ; 429 push integer
          mov rax, 429
          push rax
          ; 429 push string
          mov rax, s_72
          push rax
          ; 429 push boolean
          mov rax, 1
          push rax
          ; 429 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 432 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 432 push integer
          mov rax, 16
          push rax
          ; 432 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 432 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 433 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 433 push integer
          mov rax, 16
          push rax
          ; 433 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 433 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 433 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 434 push integer
          mov rax, 41
          push rax
          ; 434 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 435 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 435 push integer
          mov rax, 16
          push rax
          ; 435 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 435 set integer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 438 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 438 push integer
          mov rax, 0
          push rax
          ; 438 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 438 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 438 push string
          mov rax, s_25
          push rax
          ; 438 push integer
          mov rax, 438
          push rax
          ; 438 push string
          mov rax, s_72
          push rax
          ; 438 push boolean
          mov rax, 1
          push rax
          ; 438 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 438 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 438 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000034
          ; 439 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 440 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 440 push integer
          mov rax, 0
          push rax
          ; 440 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 440 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 440 push integer
          mov rax, 8
          push rax
          ; 440 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 440 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 439 jump
          jmp end_0x0000000000000034
          ; 439 label
if_0x0000000000000034: 
          ; 439 label
end_0x0000000000000034: 
          ; 443 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 443 push integer
          mov rax, 0
          push rax
          ; 443 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 443 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 444 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 444 push integer
          mov rax, 0
          push rax
          ; 444 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 444 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 427 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 427 return
          ret
          ; 447 function definition
free:     
          push rbp
          mov rbp, rsp
          ; 450 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 450 push integer
          mov rax, 41
          push rax
          ; 450 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 452 duplicate
          pop rax
          push rax
          push rax
          ; 452 push integer
          mov rax, 24
          push rax
          ; 452 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 452 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 452 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000035
          ; 453 push string
          mov rax, s_73
          push rax
          ; 453 push string
          mov rax, s_25
          push rax
          ; 453 push integer
          mov rax, 453
          push rax
          ; 453 push string
          mov rax, s_74
          push rax
          ; 453 push boolean
          mov rax, 1
          push rax
          ; 453 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 453 jump
          jmp end_0x0000000000000035
          ; 453 label
if_0x0000000000000035: 
          ; 453 label
end_0x0000000000000035: 
          ; 455 duplicate
          pop rax
          push rax
          push rax
          ; 455 push integer
          mov rax, 24
          push rax
          ; 455 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 455 push boolean
          mov rax, 1
          push rax
          ; 455 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 455 set boolean value
          pop rax
          pop rbx
          mov [rax], bl
          ; 457 duplicate
          pop rax
          push rax
          push rax
          ; 457 push integer
          mov rax, 0
          push rax
          ; 457 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 457 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 457 push string
          mov rax, s_25
          push rax
          ; 457 push integer
          mov rax, 457
          push rax
          ; 457 push string
          mov rax, s_74
          push rax
          ; 457 push boolean
          mov rax, 1
          push rax
          ; 457 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 457 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 457 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000036
          ; 458 duplicate
          pop rax
          push rax
          push rax
          ; 458 push integer
          mov rax, 0
          push rax
          ; 458 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 458 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 458 push integer
          mov rax, 24
          push rax
          ; 458 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 458 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 458 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000037
          ; 460 duplicate
          pop rax
          push rax
          push rax
          ; 460 duplicate
          pop rax
          push rax
          push rax
          ; 460 push integer
          mov rax, 0
          push rax
          ; 460 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 460 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 460 push string
          mov rax, s_25
          push rax
          ; 460 push integer
          mov rax, 460
          push rax
          ; 460 push string
          mov rax, s_74
          push rax
          ; 460 push boolean
          mov rax, 1
          push rax
          ; 460 call
          call merge_blocks
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 459 jump
          jmp end_0x0000000000000037
          ; 459 label
if_0x0000000000000037: 
          ; 459 label
end_0x0000000000000037: 
          ; 458 jump
          jmp end_0x0000000000000036
          ; 458 label
if_0x0000000000000036: 
          ; 458 label
end_0x0000000000000036: 
          ; 462 duplicate
          pop rax
          push rax
          push rax
          ; 462 push integer
          mov rax, 8
          push rax
          ; 462 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 462 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 462 push string
          mov rax, s_25
          push rax
          ; 462 push integer
          mov rax, 462
          push rax
          ; 462 push string
          mov rax, s_74
          push rax
          ; 462 push boolean
          mov rax, 1
          push rax
          ; 462 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 462 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 462 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000038
          ; 463 duplicate
          pop rax
          push rax
          push rax
          ; 463 push integer
          mov rax, 8
          push rax
          ; 463 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 463 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 463 push integer
          mov rax, 24
          push rax
          ; 463 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 463 dereference boolean
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 463 start of if-block
          pop rax
          test rax, rax
          jz if_0x0000000000000039
          ; 465 duplicate
          pop rax
          push rax
          push rax
          ; 465 push integer
          mov rax, 8
          push rax
          ; 465 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 465 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 465 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 465 push string
          mov rax, s_25
          push rax
          ; 465 push integer
          mov rax, 465
          push rax
          ; 465 push string
          mov rax, s_74
          push rax
          ; 465 push boolean
          mov rax, 1
          push rax
          ; 465 call
          call merge_blocks
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 464 jump
          jmp end_0x0000000000000039
          ; 464 label
if_0x0000000000000039: 
          ; 464 label
end_0x0000000000000039: 
          ; 463 jump
          jmp end_0x0000000000000038
          ; 463 label
if_0x0000000000000038: 
          ; 463 label
end_0x0000000000000038: 
          ; 468 label
while_0x000000000000000f: 
          ; 468 duplicate
          pop rax
          push rax
          push rax
          ; 468 push integer
          mov rax, 8
          push rax
          ; 468 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 468 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 468 push string
          mov rax, s_25
          push rax
          ; 468 push integer
          mov rax, 468
          push rax
          ; 468 push string
          mov rax, s_74
          push rax
          ; 468 push boolean
          mov rax, 1
          push rax
          ; 468 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 468 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 468 start of while-loop
          pop rax
          test rax, rax
          jz while_0x000000000000000f_end
          ; 469 duplicate
          pop rax
          push rax
          push rax
          ; 469 push integer
          mov rax, 8
          push rax
          ; 469 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 469 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 469 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 469 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 469 push string
          mov rax, s_75
          push rax
          ; 469 push string
          mov rax, s_25
          push rax
          ; 469 push integer
          mov rax, 469
          push rax
          ; 469 push string
          mov rax, s_74
          push rax
          ; 469 push boolean
          mov rax, 1
          push rax
          ; 469 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 470 duplicate
          pop rax
          push rax
          push rax
          ; 470 duplicate
          pop rax
          push rax
          push rax
          ; 470 push integer
          mov rax, 8
          push rax
          ; 470 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 470 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 470 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 470 push integer
          mov rax, 4096
          push rax
          ; 470 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 471 push string
          mov rax, s_76
          push rax
          ; 471 push string
          mov rax, s_25
          push rax
          ; 471 push integer
          mov rax, 471
          push rax
          ; 471 push string
          mov rax, s_74
          push rax
          ; 471 push boolean
          mov rax, 1
          push rax
          ; 471 call
          call assert
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 473 push integer
          mov rax, 8
          push rax
          ; 473 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 473 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 468 end of while-loop
          jmp while_0x000000000000000f
while_0x000000000000000f_end: 
          ; 475 duplicate
          pop rax
          push rax
          push rax
          ; 475 push integer
          mov rax, 0
          push rax
          ; 475 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 475 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 475 push string
          mov rax, s_25
          push rax
          ; 475 push integer
          mov rax, 475
          push rax
          ; 475 push string
          mov rax, s_74
          push rax
          ; 475 push boolean
          mov rax, 1
          push rax
          ; 475 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 475 is equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmove rax, rbx
          push rax
          ; 475 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000003a
          ; 477 push integer
          mov rax, 24
          push rax
          ; 477 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 478 duplicate
          pop rax
          push rax
          push rax
          ; 478 push integer
          mov rax, 0
          push rax
          ; 478 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 478 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 479 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 479 duplicate
          pop rax
          push rax
          push rax
          ; 479 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 479 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 479 push integer
          mov rax, 8
          push rax
          ; 479 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 479 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 479 push integer
          mov rax, 0
          push rax
          ; 479 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 479 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 481 duplicate
          pop rax
          push rax
          push rax
          ; 481 push integer
          mov rax, 0
          push rax
          ; 481 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 481 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 481 push string
          mov rax, s_25
          push rax
          ; 481 push integer
          mov rax, 481
          push rax
          ; 481 push string
          mov rax, s_74
          push rax
          ; 481 push boolean
          mov rax, 1
          push rax
          ; 481 call
          call NULL
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 481 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 481 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000003b
          ; 482 duplicate
          pop rax
          push rax
          push rax
          ; 482 push integer
          mov rax, 8
          push rax
          ; 482 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 482 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 483 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 483 duplicate
          pop rax
          push rax
          push rax
          ; 483 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 483 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 483 push integer
          mov rax, 0
          push rax
          ; 483 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 483 dereference pointer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 483 push integer
          mov rax, 8
          push rax
          ; 483 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 483 set pointer value
          pop rax
          pop rbx
          mov [rax], rbx
          ; 482 jump
          jmp end_0x000000000000003b
          ; 482 label
if_0x000000000000003b: 
          ; 482 label
end_0x000000000000003b: 
          ; 485 duplicate
          pop rax
          push rax
          push rax
          ; 486 duplicate
          pop rax
          push rax
          push rax
          ; 486 push integer
          mov rax, 16
          push rax
          ; 486 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 486 dereference integer
          pop rax
          mov rbx, [rax]
          push rbx
          ; 487 push integer
          mov rax, 11
          push rax
          ; 488 syscall
          pop rax
          pop rsi
          pop rdi
          syscall
          push rax
          ; 490 push integer
          mov rax, 0
          push rax
          ; 490 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 490 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000003c
          ; 491 push string
          mov rax, s_77
          push rax
          ; 491 push string
          mov rax, s_25
          push rax
          ; 491 push integer
          mov rax, 491
          push rax
          ; 491 push string
          mov rax, s_74
          push rax
          ; 491 push boolean
          mov rax, 1
          push rax
          ; 491 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 491 jump
          jmp end_0x000000000000003c
          ; 491 label
if_0x000000000000003c: 
          ; 491 label
end_0x000000000000003c: 
          ; 476 jump
          jmp end_0x000000000000003a
          ; 476 label
if_0x000000000000003a: 
          ; 476 label
end_0x000000000000003a: 
          ; 493 push string
          mov rax, s_25
          push rax
          ; 493 push integer
          mov rax, 493
          push rax
          ; 493 push string
          mov rax, s_74
          push rax
          ; 493 push boolean
          mov rax, 1
          push rax
          ; 493 call
          call verify_memory
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 448 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 448 return
          ret
          ; 496 function definition
puti:     
          push rbp
          mov rbp, rsp
          ; 498 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 498 push string
          mov rax, s_25
          push rax
          ; 498 push integer
          mov rax, 498
          push rax
          ; 498 push string
          mov rax, s_78
          push rax
          ; 498 push boolean
          mov rax, 1
          push rax
          ; 498 call
          call itos
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 498 push string
          mov rax, s_25
          push rax
          ; 498 push integer
          mov rax, 498
          push rax
          ; 498 push string
          mov rax, s_78
          push rax
          ; 498 push boolean
          mov rax, 1
          push rax
          ; 498 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 497 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 497 return
          ret
          ; 501 function definition
errori:   
          push rbp
          mov rbp, rsp
          ; 503 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 503 push string
          mov rax, s_25
          push rax
          ; 503 push integer
          mov rax, 503
          push rax
          ; 503 push string
          mov rax, s_79
          push rax
          ; 503 push boolean
          mov rax, 1
          push rax
          ; 503 call
          call itos
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 503 push string
          mov rax, s_25
          push rax
          ; 503 push integer
          mov rax, 503
          push rax
          ; 503 push string
          mov rax, s_79
          push rax
          ; 503 push boolean
          mov rax, 1
          push rax
          ; 503 call
          call error
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 502 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 502 return
          ret
          ; 506 function definition
_concat:  
          push rbp
          mov rbp, rsp
          ; 509 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 509 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 509 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 509 push integer
          mov rax, 1
          push rax
          ; 509 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 509 push string
          mov rax, s_25
          push rax
          ; 509 push integer
          mov rax, 509
          push rax
          ; 509 push string
          mov rax, s_80
          push rax
          ; 509 push boolean
          mov rax, 1
          push rax
          ; 509 call
          call malloc
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 510 get argument
          mov rax, rbp
          add rax, 72
          mov rbx, [rax]
          push rbx
          ; 510 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 510 push string
          mov rax, s_25
          push rax
          ; 510 push integer
          mov rax, 510
          push rax
          ; 510 push string
          mov rax, s_80
          push rax
          ; 510 push boolean
          mov rax, 1
          push rax
          ; 510 call
          call strcpy
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 511 duplicate
          pop rax
          push rax
          push rax
          ; 511 get argument
          mov rax, rbp
          add rax, 64
          mov rbx, [rax]
          push rbx
          ; 511 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 511 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 511 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 511 push string
          mov rax, s_25
          push rax
          ; 511 push integer
          mov rax, 511
          push rax
          ; 511 push string
          mov rax, s_80
          push rax
          ; 511 push boolean
          mov rax, 1
          push rax
          ; 511 call
          call strcpy
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 511 drop
          pop rax
          ; 507 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 507 return
          ret
          ; 514 function definition
concat:   
          push rbp
          mov rbp, rsp
          ; 516 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 516 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 516 push string
          mov rax, s_25
          push rax
          ; 516 push integer
          mov rax, 516
          push rax
          ; 516 push string
          mov rax, s_81
          push rax
          ; 516 push boolean
          mov rax, 1
          push rax
          ; 516 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 516 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 516 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 516 push string
          mov rax, s_25
          push rax
          ; 516 push integer
          mov rax, 516
          push rax
          ; 516 push string
          mov rax, s_81
          push rax
          ; 516 push boolean
          mov rax, 1
          push rax
          ; 516 call
          call strlen
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 516 push string
          mov rax, s_25
          push rax
          ; 516 push integer
          mov rax, 516
          push rax
          ; 516 push string
          mov rax, s_81
          push rax
          ; 516 push boolean
          mov rax, 1
          push rax
          ; 516 call
          call _concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 515 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 515 return
          ret
          ; 519 function definition
concatfl: 
          push rbp
          mov rbp, rsp
          ; 521 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 521 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 521 push string
          mov rax, s_25
          push rax
          ; 521 push integer
          mov rax, 521
          push rax
          ; 521 push string
          mov rax, s_82
          push rax
          ; 521 push boolean
          mov rax, 1
          push rax
          ; 521 call
          call concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 522 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 522 push string
          mov rax, s_25
          push rax
          ; 522 push integer
          mov rax, 522
          push rax
          ; 522 push string
          mov rax, s_82
          push rax
          ; 522 push boolean
          mov rax, 1
          push rax
          ; 522 call
          call free
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 520 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 520 return
          ret
          ; 525 function definition
concatfr: 
          push rbp
          mov rbp, rsp
          ; 527 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 527 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 527 push string
          mov rax, s_25
          push rax
          ; 527 push integer
          mov rax, 527
          push rax
          ; 527 push string
          mov rax, s_83
          push rax
          ; 527 push boolean
          mov rax, 1
          push rax
          ; 527 call
          call concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 528 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 528 push string
          mov rax, s_25
          push rax
          ; 528 push integer
          mov rax, 528
          push rax
          ; 528 push string
          mov rax, s_83
          push rax
          ; 528 push boolean
          mov rax, 1
          push rax
          ; 528 call
          call free
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 526 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 526 return
          ret
          ; 531 function definition
concatf:  
          push rbp
          mov rbp, rsp
          ; 533 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 533 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 533 push string
          mov rax, s_25
          push rax
          ; 533 push integer
          mov rax, 533
          push rax
          ; 533 push string
          mov rax, s_84
          push rax
          ; 533 push boolean
          mov rax, 1
          push rax
          ; 533 call
          call concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 534 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 534 push string
          mov rax, s_25
          push rax
          ; 534 push integer
          mov rax, 534
          push rax
          ; 534 push string
          mov rax, s_84
          push rax
          ; 534 push boolean
          mov rax, 1
          push rax
          ; 534 call
          call free
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 535 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 535 push string
          mov rax, s_25
          push rax
          ; 535 push integer
          mov rax, 535
          push rax
          ; 535 push string
          mov rax, s_84
          push rax
          ; 535 push boolean
          mov rax, 1
          push rax
          ; 535 call
          call free
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 532 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 532 return
          ret
          ; 538 function definition
stoi:     
          push rbp
          mov rbp, rsp
          ; 540 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 540 push integer
          mov rax, 0
          push rax
          ; 541 label
while_0x0000000000000010: 
          ; 541 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 541 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 541 push integer
          mov rax, 0
          push rax
          ; 541 is not equal?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovne rax, rbx
          push rax
          ; 541 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000010_end
          ; 542 push integer
          mov rax, 10
          push rax
          ; 542 multiply
          pop rax
          pop rbx
          imul rbx, rax
          push rbx
          ; 543 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 543 dereference character
          pop rax
          xor rbx, rbx
          mov bl, [rax]
          push rbx
          ; 545 duplicate
          pop rax
          push rax
          push rax
          ; 545 push character
          mov rax, `0`
          push rax
          ; 545 is less?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovl rax, rbx
          push rax
          ; 545 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 545 push character
          mov rax, `9`
          push rax
          ; 545 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 545 bitwise or
          pop rax
          pop rbx
          or rbx, rax
          push rbx
          ; 545 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000003d
          ; 546 push string
          mov rax, s_85
          push rax
          ; 546 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 546 push string
          mov rax, s_25
          push rax
          ; 546 push integer
          mov rax, 546
          push rax
          ; 546 push string
          mov rax, s_86
          push rax
          ; 546 push boolean
          mov rax, 1
          push rax
          ; 546 call
          call concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 546 push string
          mov rax, s_7
          push rax
          ; 546 push string
          mov rax, s_25
          push rax
          ; 546 push integer
          mov rax, 546
          push rax
          ; 546 push string
          mov rax, s_86
          push rax
          ; 546 push boolean
          mov rax, 1
          push rax
          ; 546 call
          call concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 546 push string
          mov rax, s_25
          push rax
          ; 546 push integer
          mov rax, 546
          push rax
          ; 546 push string
          mov rax, s_86
          push rax
          ; 546 push boolean
          mov rax, 1
          push rax
          ; 546 call
          call raise
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 546 jump
          jmp end_0x000000000000003d
          ; 546 label
if_0x000000000000003d: 
          ; 546 label
end_0x000000000000003d: 
          ; 548 push character
          mov rax, `0`
          push rax
          ; 548 subtract
          pop rax
          pop rbx
          sub rbx, rax
          push rbx
          ; 548 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 549 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 549 push integer
          mov rax, 1
          push rax
          ; 549 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 549 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 541 end of while-loop
          jmp while_0x0000000000000010
while_0x0000000000000010_end: 
          ; 539 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 539 return
          ret
          ; 552 create buffer
          ; 554 function definition
read_file: 
          push rbp
          mov rbp, rsp
          ; 556 push integer
          mov rax, 1
          push rax
          ; 556 push string
          mov rax, s_25
          push rax
          ; 556 push integer
          mov rax, 556
          push rax
          ; 556 push string
          mov rax, s_87
          push rax
          ; 556 push boolean
          mov rax, 1
          push rax
          ; 556 call
          call malloc
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 557 duplicate
          pop rax
          push rax
          push rax
          ; 557 push integer
          mov rax, 0
          push rax
          ; 557 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 557 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 558 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 558 push character
          mov rax, `r`
          push rax
          ; 558 push string
          mov rax, s_25
          push rax
          ; 558 push integer
          mov rax, 558
          push rax
          ; 558 push string
          mov rax, s_87
          push rax
          ; 558 push boolean
          mov rax, 1
          push rax
          ; 558 call
          call open
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 560 push integer
          mov rax, 1
          push rax
          ; 560 label
while_0x0000000000000011: 
          ; 560 duplicate
          pop rax
          push rax
          push rax
          ; 560 push integer
          mov rax, 0
          push rax
          ; 560 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 560 start of while-loop
          pop rax
          test rax, rax
          jz while_0x0000000000000011_end
          ; 561 drop
          pop rax
          ; 562 duplicate
          pop rax
          push rax
          push rax
          ; 562 get pointer to buffer
          mov rax, _read_file_buffer
          push rax
          ; 562 push integer
          mov rax, 512
          push rax
          ; 562 push string
          mov rax, s_25
          push rax
          ; 562 push integer
          mov rax, 562
          push rax
          ; 562 push string
          mov rax, s_87
          push rax
          ; 562 push boolean
          mov rax, 1
          push rax
          ; 562 call
          call read
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 563 duplicate
          pop rax
          push rax
          push rax
          ; 563 get pointer to buffer
          mov rax, _read_file_buffer
          push rax
          ; 563 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 563 push integer
          mov rax, 0
          push rax
          ; 563 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 563 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 564 duplicate
          pop rax
          push rax
          push rax
          ; 564 push integer
          mov rax, 0
          push rax
          ; 564 is greater?
          mov rax, 0
          mov rbx, 1
          pop rcx
          pop rdx
          cmp rdx, rcx
          cmovg rax, rbx
          push rax
          ; 564 start of if-block
          pop rax
          test rax, rax
          jz if_0x000000000000003e
          ; 565 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 565 duplicate
          pop rax
          push rax
          push rax
          ; 565 get pointer to buffer
          mov rax, _read_file_buffer
          push rax
          ; 565 push string
          mov rax, s_25
          push rax
          ; 565 push integer
          mov rax, 565
          push rax
          ; 565 push string
          mov rax, s_87
          push rax
          ; 565 push boolean
          mov rax, 1
          push rax
          ; 565 call
          call concat
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 566 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 566 push string
          mov rax, s_25
          push rax
          ; 566 push integer
          mov rax, 566
          push rax
          ; 566 push string
          mov rax, s_87
          push rax
          ; 566 push boolean
          mov rax, 1
          push rax
          ; 566 call
          call free
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 567 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 567 rot
          pop rax
          pop rbx
          pop rcx
          push rbx
          push rax
          push rcx
          ; 565 jump
          jmp end_0x000000000000003e
          ; 565 label
if_0x000000000000003e: 
          ; 565 label
end_0x000000000000003e: 
          ; 560 end of while-loop
          jmp while_0x0000000000000011
while_0x0000000000000011_end: 
          ; 568 drop
          pop rax
          ; 568 drop
          pop rax
          ; 555 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 555 return
          ret
          ; 571 function definition
substring: 
          push rbp
          mov rbp, rsp
          ; 574 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 574 push integer
          mov rax, 1
          push rax
          ; 574 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 574 push string
          mov rax, s_25
          push rax
          ; 574 push integer
          mov rax, 574
          push rax
          ; 574 push string
          mov rax, s_88
          push rax
          ; 574 push boolean
          mov rax, 1
          push rax
          ; 574 call
          call malloc
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          push rax
          ; 575 get argument
          mov rax, rbp
          add rax, 56
          mov rbx, [rax]
          push rbx
          ; 575 over
          pop rax
          pop rbx
          push rbx
          push rax
          push rbx
          ; 575 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 575 push string
          mov rax, s_25
          push rax
          ; 575 push integer
          mov rax, 575
          push rax
          ; 575 push string
          mov rax, s_88
          push rax
          ; 575 push boolean
          mov rax, 1
          push rax
          ; 575 call
          call memcpy
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 576 duplicate
          pop rax
          push rax
          push rax
          ; 576 get argument
          mov rax, rbp
          add rax, 48
          mov rbx, [rax]
          push rbx
          ; 576 add
          pop rax
          pop rbx
          add rbx, rax
          push rbx
          ; 576 push integer
          mov rax, 0
          push rax
          ; 576 swap
          pop rax
          pop rbx
          push rax
          push rbx
          ; 576 set character value
          pop rax
          pop rbx
          mov [rax], bl
          ; 572 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 572 return
          ret
          ; 3 function definition
start:    
          push rbp
          mov rbp, rsp
          ; 4 push string
          mov rax, s_89
          push rax
          ; 4 push string
          mov rax, s_90
          push rax
          ; 4 push integer
          mov rax, 4
          push rax
          ; 4 push string
          mov rax, s_91
          push rax
          ; 4 push boolean
          mov rax, 1
          push rax
          ; 4 call
          call puts
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          pop rbx
          ; 4 restore frame
          pop rax
          mov rsp, rbp
          pop rbp
          ; 4 return
          ret
_start:   
          xor rax, rax
          push rax
          push rax
          push rax
          push rax
          call start
_end:     
          mov rdi, rax
          mov rax, 60
          syscall
          section .data
s_1: db `0`, 0 
s_2: db `lib/boba/core.bb`, 0 
s_3: db `traceback`, 0 
s_4: db `\nTraceback:\n`, 0 
s_5: db `, line `, 0 
s_6: db ` in `, 0 
s_7: db `\n`, 0 
s_8: db `lib/std/linux.bb`, 0 
s_9: db `puts`, 0 
s_10: db `error`, 0 
s_11: db `raise`, 0 
s_12: db `assert`, 0 
s_13: db `Could not open file\n`, 0 
s_14: db `open`, 0 
s_15: db `Could not read file\n`, 0 
s_16: db `read`, 0 
s_17: db `Could not change signal action\n`, 0 
s_18: db `rt_sigaction`, 0 
s_19: db `RT_SIGRETURN should not return\n`, 0 
s_20: db `rt_sigreturn`, 0 
s_21: db `Could not set the timer\n`, 0 
s_22: db `setitimer`, 0 
s_23: db `setup_signal_handler`, 0 
s_24: db `set_timer`, 0 
s_25: db `lib/std.bb`, 0 
s_26: db `streq`, 0 
s_27: db `Verifying memory..\n`, 0 
s_28: db `verify_memory`, 0 
s_29: db `* Page: `, 0 
s_30: db `  * prev: `, 0 
s_31: db `  * next: `, 0 
s_32: db `  * size: `, 0 
s_33: db `Pointer to previous page should be valid\n`, 0 
s_34: db `Page size should be at least the default value\n`, 0 
s_35: db `Page without blocks should be unmapped`, 0 
s_36: db `  * block: `, 0 
s_37: db `    * file: `, 0 
s_38: db `    * line: `, 0 
s_39: db `    * size: `, 0 
s_40: db `    * next: `, 0 
s_41: db `    * prev: `, 0 
s_42: db `    * free: `, 0 
s_43: db `true\n`, 0 
s_44: db `false\n`, 0 
s_45: db `Blocks should not overflow page memory\n`, 0 
s_46: db `Next block should be in the same page\n`, 0 
s_47: db `Previous block should be in the same page\n`, 0 
s_48: db `Next block should be directly after this one\n`, 0 
s_49: db `Previous block should be directly before this one\n`, 0 
s_50: db `  * unused bytes: `, 0 
s_51: db `Block sizes should sum up to page size\n`, 0 
s_52: db `Memory OK\n`, 0 
s_53: db `Page size should be at least the default size\n`, 0 
s_54: db `_malloc_get_next_page`, 0 
s_55: db `Unable to allocate memory page\n`, 0 
s_56: db ``, 0 
s_57: db `Next page should not be NULL\n`, 0 
s_58: db `Splitted block should be free\n`, 0 
s_59: db `_malloc_split_block`, 0 
s_60: db `_malloc_block_is_available_or_NULL`, 0 
s_61: db `malloc`, 0 
s_62: db `Size should be greater than zero\n`, 0 
s_63: db `First page should be set\n`, 0 
s_64: db `Page should not be root page\n`, 0 
s_65: db `Next page should be set\n`, 0 
s_66: db `Block size should be greater than zero\n`, 0 
s_67: db `Pointer to found block should be non-NULL\n`, 0 
s_68: db `Found block should be free\n`, 0 
s_69: db `zalloc`, 0 
s_70: db `memcpy`, 0 
s_71: db `Blocks should be free`, 0 
s_72: db `merge_blocks`, 0 
s_73: db `Trying to free already freed data\n`, 0 
s_74: db `free`, 0 
s_75: db `Previous block should be earlier\n`, 0 
s_76: db `Previous block should be within the same page\n`, 0 
s_77: db `Unable to free memory page\n`, 0 
s_78: db `puti`, 0 
s_79: db `errori`, 0 
s_80: db `_concat`, 0 
s_81: db `concat`, 0 
s_82: db `concatfl`, 0 
s_83: db `concatfr`, 0 
s_84: db `concatf`, 0 
s_85: db `Unable to convert string to integer: `, 0 
s_86: db `stoi`, 0 
s_87: db `read_file`, 0 
s_88: db `substring`, 0 
s_89: db `hey``, 0 
s_90: db `lol.bb`, 0 
s_91: db `start`, 0 
          section .bss
_itos: resb 21 
_sigaction: resb 32 
_itimerval: resb 32 
current_page: resb 8 
root_page: resb 8 
VERIFY_MEMORY: resb 1 
DUMP_MEMORY: resb 1 
_vm_buf: resb 19 
_read_file_buffer: resb 513 
