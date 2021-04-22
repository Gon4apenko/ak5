TITLE ЛР_5 
;------------------------------------------------------------------------------
;ЛР  №5
;------------------------------------------------------------------------------
; Програмування 3. Системне програмування
; Завдання:              Основи розробки і налагодження
; ВУЗ:                  КНУУ "КПІ"
; Факультет:    ФІОТ
; Курс:                1
; Група:       ІТ-01
;------------------------------------------------------------------------------
; Автор:        Гончаренко Доброхотова Нікітченко
; Дата:         22/04/21
;---------------------------------
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 2048		; Директива - розмір стеку 

DATASEG
array2Db db "7358118726277179" ; створення масиву
         db "4627022455147997"
         db "6691608838469303"
         db "1110608890317491"
         db "7512807090310748"
         db "6813005110415567"
         db "6010604050318858"
         db "7613005460414059"
         db "6612807030391791"
         db "6310604563158886"
         db "8712807265419564"
         db "1325082956458837"
         db "2080054842790953"
         db "6299944599303642"
         db "6176396115203803"
         db "2374689571001449"
Len dw 257 
CODESEG

Sort: ; сортування
    mov cx, 255 ; кількість повторів
    mov bx, 0
    mov si, 0

    l1:
    push cx ;занесення значення cx до стеку
    mov cx, 255

        l2:
        mov ah, [ds:si]  ;занесення значення для порівняння до ah
        mov al, [ds:si+1];занесення значення для порівняння до al

        cmp ah, al ;порівняння ah та al
        jl lesser ; якщо al < ah, то перейти
        greater:
            mov [ds:si], al   ;заміна значень
            mov [ds:si+1], ah ;заміна значень

        lesser:
        inc si;збільшення значення si
        loop l2;перевірка cx

    mov si, 0
    ;inc bx; збільшення значення bx
    pop cx ;діставання значення cx зі стеку
    loop l1;перевірка cx 
    jmp AfterSort

Start:
    mov ax, @data ;занесення початку датасегменту до ax
    mov ds, ax ;ініціалізація датасегменту
    mov es, ax ;ініціалізація додаткового сегменту
	
	mov cx, 5h
	mov si, 16*3+3
        copy_loop:
            mov [ds:si], 3830h            
            add si, 2                     
            mov [ds:si], 3530h
			add si, 2                   
            mov [ds:si], 3032h
			add si, 2   
			mov [ds:si], 3330h 
			add si, 10   
			
            mov [ds:si], 3130h            
            add si, 2                      
            mov [ds:si], 3230h
			add si, 2                     
            mov [ds:si], 3032h
			add si, 2   
			mov [ds:si], 3230h 
			add si, 10  

            mov [ds:si], 3830h            
            add si, 2                    
            mov [ds:si], 3031h 
			add si, 2                     
            mov [ds:si], 3032h
			add si, 2   
			mov [ds:si], 3330h 
			add si, 2




			
			loop copy_loop	
			
    jmp Sort
    AfterSort:


    mov ah,4ch
    int 21h ; виклик переривання DOS

end Start