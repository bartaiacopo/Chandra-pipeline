
;defsysv,'!isa',{ $
;                 dir  : !isa_xwsm_path + '/isa_nov01/', $
;                 cal  : !isa_xwsm_path + '/isa_nov01/home_made_cal/', $
;                 ccf  : !isa_xwsm_path + '/isa_nov01/ccf/', $
;                 test : !isa_xwsm_path + '/isa_nov01/test/', $
;                 vers : 'nov01'}

print
print, '==============================================================='
print, '                X-ray Chandra Analysis Package'
print, '---------------------------------------------------------------'
print, '                Version : ', !xwsm.vers
print, '                date    : ', !xwsm.date
print, '                (using ISA, ', !isa.vers,' version)'
print, '==============================================================='
print

;if !version.os_family eq 'vms' then !path = expand_path('+'+!isa.dir)+','+!path
;if !version.os_family eq 'unix' then !path = $
;          expand_path('+'+strmid(!isa.dir,0,strlen(!isa.dir)-1))+':'+!path
;!help_path = !help_path +':'+concat_dirs(!isa.dir,'help')
!prompt ='CAP> '

; IDL environnement...
!order      =  0  ; to be compatible with cia
!edit_input = 100 ; increase number of lines in command buffer
;;!quiet      = 1

; *** This is for colors, can be customized  

init_find_colors
loadct, 39  ; Stern lut
!p.color      = !black
!p.background = !white

; *** Some useful shortcuts ***

define_key, 'f6', 'help, name="*" ', /terminate
define_key, 'f5',  'retall', /terminate
;;define_key, 'f6', '@reset', /terminate


; new symbol
A = FINDGEN(25) *  (!PI*2/24.) 
USERSYM, COS(A), SIN(A), /FILL



;------- Constantes pratiques --------

defsysv, '!kev2k', 1.16059*1.e7
defsysv, '!kev2j', 1.60219e-16
defsysv, '!h',  6.626e-34
defsysv, '!k',  1.3806e-23
defsysv, '!cc', 2.998e8
defsysv, '!mo', 1.9891d30
defsysv, '!mp', 1.67262178d-27
defsysv, '!pc', 30.856776d15
defsysv, '!g',  6.67428d-11
