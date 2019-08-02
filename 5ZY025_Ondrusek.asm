mvi a,0x09	       
out 3,a

mvi a, 0x49
out 5,a

mvi a, 0x08
out 6,a

Aktivuj:

inn c,1111111111011111b 
ori c,11110000b
cmi c , 251
jzr, Start

jmp Aktivuj

Start:

mvi a, 4
mvi d, 5 ;Prva cislica z hesla
str a,d

mvi a, 5
mvi d, 6  ;druha cislica z hesla
str a,d



byte 2
mvi a, 1
mvi b, 1
str a, b

mvi a, 0
mvi b, 150
str a,b
mvi a,0x09	       
out 3,a

mvi a, 0x49
out 5,a

mvi a, 0x08
out 6,a

mvi b, 9	       

lmi c, 0
jmp Inicializacia

NastavTretiDisplej:
mvi a, 0
ldr c ,a
cmi c ,30
jzr Vybuch

mvi b, 9
mvi a,0x09	       
out 3,a

mvi a, 0
ldr c ,a
cmi c ,138
jzr PrvyDisplejOsem

mvi a, 0
ldr c ,a
cmi c ,126
jzr PrvyDisplejSedem

mvi a, 0
ldr c ,a
cmi c ,114
jzr PrvyDisplejSest

mvi a, 0
ldr c ,a
cmi c ,102
jzr PrvyDisplejPat

mvi a, 0
ldr c ,a
cmi c ,90
jzr PrvyDisplejStyri

mvi a, 0
ldr c ,a
cmi c ,78
jzr PrvyDisplejTri

mvi a, 0
ldr c ,a
cmi c ,66
jzr PrvyDisplejDva

mvi a, 0
ldr c ,a
cmi c ,54
jzr PrvyDisplejJeden

mvi a, 0
ldr c ,a
cmi c ,42
jzr PrvyDisplejNula

PokracTreti:
jmp Inicializacia

Sekundy:
cmi b, 9
jzr 8

cmi b, 8
jzr 7

cmi b, 7
jzr 6

cmi b, 6
jzr 5

cmi b,5
jzr 4

cmi b, 4
jzr 3

cmi b, 3
jzr 2

cmi b, 2
jzr 1

cmi b, 1
jzr 0

cmi b,0
jzr 0

8:
mvi a,0x01	       
out 3,a
dec b
jmp Inicializacia

7:
mvi a,0x1F	       
out 3,a
dec b
jmp Inicializacia

6:
mvi a,0x41	       
out 3,a
dec b
jmp Inicializacia

5:
mvi a,0x49       
out 3,a
dec b
jmp Inicializacia

4:
mvi a,0x99	       
out 3,a
dec b
jmp Inicializacia

3:
mvi a,0x0D	       
out 3,a
dec b
jmp Inicializacia

2:
mvi a,0x25	       
out 3,a
dec b
jmp Inicializacia

1:
mvi a,0x9F	       
out 3,a
dec b
jmp Inicializacia

0:
mvi a, 0
ldr d , a
dec d
str a, d

cmi b, 0
mvi d, 1
jzr InicDruhyDisp
mvi a,0x03	       
out 3,a
dec b



Inicializacia:
mxi m,1860
mvi a, 140

Delay:
dcx m
mvx c,m
cmi c, 0
jnz Delay
jzr Over
Pokracovanie:
dec, a
cmi a,0
jnz Nastav
jzr Sekundy

Nastav:
mxi m,1860
jmp Delay

DruhyDisplej:
mvi a, 0
ldr c ,a
cmi c ,30
jzr NastavTretiDisplej
pop b

cmi b, 6
jzr D5

cmi b, 5
jzr D4

cmi b, 4
jzr D3

cmi b, 3
jzr D2

cmi b, 2
jzr D1

cmi b, 1
jzr D0

D5:
jmp Oprava
D55:
mvi a, 0x49
out 5,a
dec b
pus b
jmp NastavTretiDisplej

D4:
mvi a, 0x99
out 5,a
dec b
pus b
jmp NastavTretiDisplej

D3:
mvi a, 0x0D
out 5,a
dec b
pus b
jmp NastavTretiDisplej

D2:
mvi a, 0x25
out 5,a
dec b
pus b
jmp NastavTretiDisplej

D1:
mvi a, 0x9F
out 5,a
dec b
pus b
jmp NastavTretiDisplej

D0:
mvi a, 0x03
out 5,a
dec b
pus b
jmp NastavTretiDisplej

Oprava:
mvi a, 1
ldr d, a
mvi a, 0
mmr c, a
cmp d ,c
jzr D55
mvi a, 0x99
out 5,a
dec b
dec b
mvi a, 1
ldr d, a
inc d
str a ,d
pus b
jmp NastavTretiDisplej

InicDruhyDisp:
pop a
cmi a,0
jzr Nastav1
pus a
jmp DruhyDisplej

Nastav1:
mvi b ,6
pus b
jmp DruhyDisplej


PrvyDisplejOsem:
mvi a, 0x00
out 6,a
jmp PokracTreti

PrvyDisplejSedem:
mvi a, 0x1E
out 6,a
jmp PokracTreti


PrvyDisplejSest:
mvi a, 0x40
out 6,a
jmp PokracTreti

PrvyDisplejPat:
mvi a, 0x48
out 6,a
jmp PokracTreti

PrvyDisplejStyri:
mvi a, 0x98
out 6,a
jmp PokracTreti

PrvyDisplejTri:
mvi a, 0x0C
out 6,a
jmp PokracTreti

PrvyDisplejDva:
mvi a, 0x24
out 6,a
jmp PokracTreti

PrvyDisplejJeden:
mvi a, 0x9E
out 6,a
jmp PokracTreti


PrvyDisplejNula:
mvi a, 0x02
out 6,a
jmp PokracTreti


Over:
pus a
pus b
pus c
pus d



inn c,1111111111110111b 
ori c,11110000b

cmi c , 254
jzr, HesloNula1
mvi a, 10
mvi d,0
str a, d

cmi c , 253
jzr, HesloJeden1
mvi a, 11
mvi d,0
str a, d


cmi c , 251
jzr, HesloDva1
mvi a, 12
mvi d,0
str a, d

cmi c , 247
jzr, HesloTri1
mvi a, 13
mvi d,0
str a, d

inn c,1111111111101111b 
ori c,11110000b

cmi c , 254
jzr, HesloStyri1
mvi a, 14
mvi d,0
str a, d

cmi c , 253
jzr, HesloPat1
mvi a, 15
mvi d,0
str a, d


cmi c , 251
jzr, HesloSest1
mvi a, 16
mvi d,0
str a, d

cmi c , 247
jzr, HesloSedem1
mvi a, 17
mvi d,0
str a, d


inn c,1111111111011111b 
ori c,11110000b

cmi c , 254
jzr, HesloOsem1
mvi a, 18
mvi d,0
str a, d

cmi c , 253
jzr, HesloDevat1
mvi a, 19
mvi d,0
str a, d
jmp Naspat

HesloNula1:

mvi a, 10
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloNula2

mvi a, 10
mvi d,1
str a, d

mvi a, 8
mvi d,1
str a, d

mvi d, '0'
scall dsp

jmp Naspat


HesloNula2:

mvi a, 10
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 10
mvi d,1
str a, d

mvi a, 9
mvi d, 1
str a, d
mvi d, '0'
scall dsp
jmp ZistiKod


HesloJeden1:
mvi a, 11
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloJeden2

mvi a, 11
mvi d,1
str a, d

mvi a, 8
mvi d,2
str a, d

mvi d, '1'
scall dsp
jmp Naspat


HesloJeden2:
mvi a, 11
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 11
mvi d,1
str a, d

mvi a, 9
mvi d, 2
str a, d
mvi d, '1'
scall dsp
jmp ZistiKod

HesloDva1:
mvi a, 12
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloDva2

mvi a, 12
mvi d,1
str a, d

mvi a, 8
mvi d,3
str a, d
mvi d, '2'
scall dsp

jmp Naspat


HesloDva2:
mvi a, 12
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 12
mvi d,1
str a, d

mvi a, 9
mvi d, 3
str a, d
mvi d, '2'
scall dsp
jmp ZistiKod


HesloTri1:
mvi a, 13
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloTri2

mvi a, 13
mvi d,1
str a, d

mvi a, 8
mvi d,4
str a, d
mvi d, '3'
scall dsp

jmp Naspat


HesloTri2:
mvi a, 13
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 13
mvi d,1
str a, d

mvi a, 9
mvi d, 4
str a, d
mvi d, '3'
scall dsp
jmp ZistiKod

HesloStyri1:
mvi a, 14
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloStyri2

mvi a, 14
mvi d,1
str a, d

mvi a, 8
mvi d,5
str a, d
mvi d, '4'
scall dsp
jmp Naspat


HesloStyri2:
mvi a, 14
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 14
mvi d,1
str a, d

mvi a, 9
mvi d, 5
str a, d
mvi d, '4'
scall dsp
jmp ZistiKod

HesloPat1:
mvi a, 15
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloPat2

mvi a, 15
mvi d,1
str a, d

mvi a, 8
mvi d,6
str a, d
mvi d, '5'
scall dsp
jmp Naspat


HesloPat2:
mvi a, 15
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 15
mvi d,1
str a, d

mvi a, 9
mvi d, 6
str a, d
mvi d, '5'
scall dsp
jmp ZistiKod

HesloSest1:
mvi a, 16
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloSest2

mvi a, 16
mvi d,1
str a, d

mvi a, 8
mvi d,7
str a, d
mvi d, '6'
scall dsp

jmp Naspat


HesloSest2:
mvi a, 16
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 16
mvi d,1
str a, d

mvi a, 9
mvi d, 7
str a, d
mvi d, '6'
scall dsp
jmp ZistiKod

HesloSedem1:
mvi a, 17
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloSedem2

mvi a, 17
mvi d,1
str a, d

mvi a, 8
mvi d,8
str a, d
mvi d, '7'
scall dsp

jmp Naspat


HesloSedem2:
mvi a, 17
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 17
mvi d,1
str a, d

mvi a, 9
mvi d, 8
str a, d
mvi d, '7'
scall dsp
jmp ZistiKod


HesloOsem1:
mvi a, 18
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0

jnz HesloOsem2

mvi a, 18
mvi d,1
str a, d

mvi a, 8
mvi d,9
str a, d
mvi d, '8'
scall dsp

jmp Naspat


HesloOsem2:
mvi a, 18
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 18
mvi d,1
str a, d

mvi a, 9
mvi d, 9
str a, d
mvi d, '8'
scall dsp
jmp ZistiKod


HesloDevat1:
mvi a, 19
ldr d,a
cmi d, 1
jzr Naspat

mvi a, 8
ldr d, a
cmi d, 0
jnz HesloDevat2

mvi a, 19
mvi d,1
str a, d

mvi a, 8
mvi d,10
str a, d

mvi d, '9'
scall dsp
jmp Naspat


HesloDevat2:
mvi a, 19
ldr d, a
cmi d, 1
jzr Naspat

mvi a, 19
mvi d,1
str a, d

mvi a, 9
mvi d, 10
str a, d
mvi d, '9'
scall dsp
jmp ZistiKod

Naspat:
pop d
pop c
pop b
pop a
jmp Pokracovanie



ZistiKod:

mvi a, 4
ldr c,a
mvi a,8
ldr d, a
dec d
cmp c,d
jnz Vynuluj

mvi a, 5
ldr c,a
mvi a,9
ldr d, a
dec d
cmp c,d
jzr Vypnuta

Vynuluj:
mvi a, 8
mvi c, 0
str a , c

mvi a, 9
mvi c ,0
str a, c
mvi d, 10
scall dsp
mvi d, 13
scall dsp

jmp Naspat


Vybuch:
mvi d, 10
scall dsp
mvi d, 13
scall dsp
mvi d, 'B'
scall dsp
mvi d, 'O'
scall dsp
mvi d, 'M'
scall dsp
mvi d, 'B'
scall dsp
mvi d, 'A'
scall dsp
mvi d, ' '
scall dsp
mvi d, 'V'
scall dsp
mvi d, 'Y'
scall dsp
mvi d, 'B'
scall dsp
mvi d, 'U'
scall dsp
mvi d, 'C'
scall dsp
mvi d, 'H'
scall dsp
mvi d, 'L'
scall dsp
mvi d, 'A'
scall dsp

jmp Koniec

Vypnuta:

mvi d, 10
scall dsp
mvi d, 13
scall dsp
mvi d, 'B'
scall dsp
mvi d, 'O'
scall dsp
mvi d, 'M'
scall dsp
mvi d, 'B'
scall dsp
mvi d, 'A'
scall dsp
mvi d, ' '
scall dsp
mvi d, 'V'
scall dsp
mvi d, 'Y'
scall dsp
mvi d, 'P'
scall dsp
mvi d, 'N'
scall dsp
mvi d, 'U'
scall dsp
mvi d, 'T'
scall dsp
mvi d, 'A'
scall dsp

mvi a,0xff	       
out 3,a

mvi a, 0xff
out 5,a

mvi a, 0xff
out 6,a

Koniec:
