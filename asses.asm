.Model small
.Stack 100h
.Data

fill db 09,"Fill the Registration Form:$"
nam db 10,"Enter your Name:$ "
fnam db 10,"Enter your fname:$ "
institute db 10,"Enter your Institute Name:$ "
net db 10,"Enter only one is correct number$"
ext db 10,"Do you want to Exit (Y/N) $"

library db 10,09, "!###WELCOME TO SINDH MADARSA-TUL-ISLAM UNIVERSITY LIBRARY!###$"
slc db 10,09,    "SLECT ANY ONE FIELD YOU WANT TO READING BOOKS !$"
bookslect db 10,09,   "*** Select any one Book! ***$"
confirm db 10,09, "YOUR BOOK IS READY ON YOUR DIECE FOR READING!$"
sta3 db 09,    "*****###!- KHAN BAHADUR HASSAN ALI EFFANDI LIBRARY -!####*****$"

comp db 10,"1. {Computer Science }$"
csp1 db 10,09,"a)Assembly Language$"
csp2 db 10,09,"b)Java Script$"
csp3 db 10,09,"c)Python Programming Language$"
csp4 db 10,09,"d)programming Funadmentels$"
csp5 db 10,09,"e)Ethics in informatin technology$"


Medical db 10,"2. {Medical Field}$"

mp1 db 10,09,"a)Botony book$"
mp2 db 10,09,"b)Zoology book$"
mp3 db 10,09,"c)Embryology book$"
mp4 db 10,09,"d)Cardiology book$"
mp5 db 10,09,"e)Emergency Medicine$"


Business db 10,"3. {Business Adminitration}$"

bp1 db 10,09,"a)Financial Intelligence$"
bp2 db 10,09,"b)Growing a Business$"
bp3 db 10,09,"c)Leadership and self deception$"
bp4 db 10,09,"d)The one minuit Manager$"
bp5 db 10,09,"e)Business Model Genration$"

w db 10,09,"SLECT FROM PRESENT FIELDS!$" 

.Code

mov ah,01  ;take input from user now I make this only for wright choice
			 int 21h
			 cmp al,49
			 je BR
			 mov ah,09
			lea dx,net
			 int 21h
			 
                               ; new_line macro  ; function for new line
							   ; mov ah,02
							   ; mov dl,10
							   ; int 21h
							   ; endm new_line
	BR:	
 bio macro fill,nam,fnam,institute,ext;function
 mov ah,09
 lea dx,fill
 int 21h
mov ah,09
lea dx,nam
int 21h
mov ah,3fh
int 21h                  
					
 mov ah,09
 lea dx,fnam
 int 21h
 mov ah,3fh
 int 21h

 mov ah,09
 lea dx,institute
 int 21h
mov ah,3fh
int 21h
								
mov ah,09
lea dx,ext
int 21h								
 endm bio
 
Start:
mov ax,@data
mov ds,ax
 
Bio_Data:
  bio  fill,nam,fnam,institute,ext       q
  
mov ax,6 ;goto grphic mode
int 10h   ; its priority line in graphics
; draw line
mov ah,0ch ;draw line code     1st 
mov al,1 ; 1 print the white color
mov cx,30
mov dx,60
book1:
int 10h
inc cx
cmp cx,380
jle book1
            mov ah,0ch     ; 2nd
mov al,1 ; 1 print the white color
mov cx,360
mov dx,60
book2:
int 10h
inc dx
cmp dx,150
jle book2 
             mov ah,0ch ;draw line code     3rd
mov al,1 
mov cx,50
mov dx,150
book3:
int 10h
inc cx
cmp cx,360
jle book3
                   mov ah,0ch ; 4th
mov al,1 ; 1 print the white color
mov cx,50
mov dx,60
book4:
int 10h
inc dx
cmp dx,150
jle book4   
             mov ah,0ch ;draw line code      1/2 mid line 
mov al,1 
mov cx,210
mov dx,60
book5:
int 10h
inc dx
cmp dx,150
jle book5   
                ;now reverse process 
mov ah,0ch 
mov al,1 
mov cx,30
mov dx,60
book6:
int 10h
inc dx
cmp dx,170
jle book6 
                          
              mov ah,0ch ;draw line code     for make angle
mov al,1 
mov cx,30
mov dx,170
book8:
int 10h
inc cx
cmp cx,380 
jle book8
                 mov ah,0ch 
mov al,1 
mov cx,50
mov dx,150
book9:
int 10h
dec cx
inc  dx
cmp cx,30
cmp dx,170
jle book9

                   mov ah,0ch 
mov al,1 
mov cx,380
mov dx,60
           book10:
int 10h
inc dx 
cmp dx,170
jle book10
                mov al,1 
mov cx,360
mov dx,150
         book11:
int 10h
inc dx
inc cx
cmp cx,380
cmp dx,170
jle book11
                  mov ah,0
                  int 16h ;hold the result on screen
; set text mode-
mov ax,3
int 10h

mov ah,0
mov al,04h
int 10h

mov ah,0bh
mov bh,00h
mov bl,3
int 10h

mov ah,02
mov bh,0
mov dh,0
mov dl,30
int 10h

mov ah,09
lea dx,library
int 21h
;exit:
mov ah,09
lea dx,slc
int 21h

mov ah,09
lea dx,bookslect
int 21h

mov ah,09
lea dx,comp
int 21h

mov ah,09
lea dx,Medical
int 21h

mov ah,09
lea dx,Business
int 21h         ;message print complete
exit:
mov ah,01 ;this is input from user
int 21h
;this is for comapresion of values
cmp al,49
je C  ; jump to computer field  79 line 
cmp al,50
je M  ; jump medical field medical label on 129 line 
cmp al,51
je B  ; jump to BBA   line 127
mov ah,09
lea dx,w
int 21h
jmp exit
C:       ; Computer science 
mov ah,09
lea dx,csp1
int 21h
mov ah,09
lea dx,csp2
int 21h
mov ah,09
lea dx,csp3
int 21h
mov ah,09
lea dx,csp4
int 21h
mov ah,09
lea dx,csp5
int 21h
;exit:

mov ah,09
lea dx,bookslect ; with the choice slect any book 
int 21h

mov ah ,01   ; ..;this will compare according to your input and provide you a book
int 21h
cmp al,49
je loc

cmp al,50
je loc
cmp al,51
je loc
cmp al,52
je loc
cmp al,53
je loc
loc:
jmp lec
mov ah,09    ;msg Wrong Input
lea dx,w
int 21h
jmp exit

mov ah,09    ;msg Confirmation
lea dx,confirm
int 21h
jmp exit

;to resolve out of range error
B:  
jmp Bi ; line no 166
M: ;Medical field location`s
mov ah,09
lea dx,mp1
int 21h
mov ah,09
lea dx,mp2
int 21h
mov ah,09
lea dx,mp3
int 21h
mov ah,09
lea dx,mp4
int 21h
mov ah,09
lea dx,mp5
int 21h
lea dx,bookslect
int 21h

;lec:
;jmp ltc
;mov ah,09
;lea dx,bookslect
int 21h 
mov ah ,01    ;Location Inputs
int 21h
cmp al,49
je loc
cmp al,50
je loc
cmp al,51
je loc
cmp al,52
je loc
cmp al,53
je loc
mov ah,09    ;msg Wrong Input
lea dx,w
int 21h
jmp exit
lec:
jmp ltc
Bi:  ;business addministration location
mov ah,09
lea dx,bp1
int 21h
mov ah,09
lea dx,bp2
int 21h
mov ah,09
lea dx,bp3
int 21h
mov ah,09
lea dx,bp4
int 21h
mov ah,09
lea dx,bp5
int 21h
            
			
mov ah,09
lea dx,bookslect ; with the choice slect any book 
int 21h

mov ah ,01    ;this will compare according to your input and provide you a book
int 21h
cmp al,49
je ltc 
cmp al,50
je ltc
cmp al,51
je ltc
cmp al,52
je ltc
cmp al,53
je ltc
mov ah,09    ;msg Wrong Input
lea dx,w
int 21h
jmp exit


ltc:
mov ah,09
lea dx,confirm
int 21h

mov ah,4ch ; exit code
int 21h

End Start