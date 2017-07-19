;+
; NAME: cxo_init.pro
;
; PURPOSE: initialise CXO_PIP environement
;
; CATEGORY: low_level
;
; CALLING SEQUENCE: cxo_init
;
; MODIFICATION HISTORY:
;  Created by Rene Gastaud 
;  05/2015 - IB adapted for Chandra pipeline


print, '******************'
print, '* Welcome to cxo *'
print, '******************'

cxosoft_dir = getenv('CXOSOFT_DIR')

; Add Chandra pipeline
!path = expand_path('+'+strcompress(cxosoft_dir,/remove)+'/')+':'+!path

!prompt ='gdl_cxo> '

; IDL environnement...
!order      =  0  ; to be compatible with cia
!edit_input = 100 ; increase number of lines in command buffer
!quiet      = 0

; *** This is for colors, can be customized  
device,retain=2,decomposed=0
init_find_colors
loadct, 39
!p.background = !white
  
; Rainbow lut
!error_state.code = 0
; xon xeus from linux, then run idl and loadct results in:
;% X windows protocol error: BadWindow (invalid Window parameter).
; and (!error_state.code eq -595).
; This causes problems because we now pass the error code out upon exit,
;  and the csh scripts halts upon nonzero exit.
!p.color      = !black
!p.background = !white
;
; *** P Chanial Shortcuts: not compulsory
; to compile a pro, you can paste the name at the prompt and then f3 + f4

; routine initialization
 
; new symbol
A = FINDGEN(25) *  (!PI*2/24.) 
USERSYM, COS(A), SIN(A), /FILL

;=== Working cosmology [common values]
cosmo = {NAME:'LCDM' $
         ,h0:0.7 $
         ,omega_m:0.3 $
         ,omega_l:0.7 $
         ,omega_b:0.042 $
         ,omega_r:0. $
         ,omega_k:0. $
         ,wx:0. $
         ,n:0.953 $
         ,sigma8:0.74} 
defsysv, '!cosmo', cosmo

;=== Useful constant
useful_const = {NAME:'Useful Constant',$
                h:6.6260755d-34,$          ;constante de Planck
                c:2.99792458d8,$           ;celerite de la lumiere dans le vide
                k:1.380658d-23,$           ;constante de Boltzmann
                kb:1.380658d-23,$          ;constante de Boltzmann
                re:2.82d-15,$              ;rayon electronique
                e:1.60217733d-19,$         ;charge de l'electron
                grav:6.67259d-11,$         ;constante de gravitation universelle
                me:9.1093897d-31,$         ;masse de l'electron en kg
                mp:1.6726231d-27,$         ;masse du proton en kg
                Tcmb:2.725d0,$             ;temperature du CMB
                rho_c:1.35971d+11,$      ; M0/Mpc^3. Densite critique
                sigma_thomson:6.6524d-29,$ ;section efficace de diffusion thomson
                mpc:3.0856775807d22,$      ; 1Mpc 
                kpc:3.0856775807d19,$      ; 1kpc 
                pc:3.0856775807d16,$       ; 1pc 
                msol:1.98892d30,$          ; masse solaire en kg
                lsol:3.846d26,$            ; solar luminosity
                mue:1.146,$                ; masse baryonique par electron du MIG
                mu:0.597,$                 ; poids moleculaire moyen du MIG
                                           ; for plasma with a helium mass fraction
                                           ; of Y=0.24 and a metalicity of 30%
                                           ; Pratt & Arnaud, 2002, A1413 
                                           ; based on 9H for 1He
                keVtoK:1.16059d7,$         ; From KeV to Kelvin
                evolt:1.60219e-19,$        ; electron volt
                sqdegsky:41253.0}          ; Square degrees on the sky
defsysv, '!useful_const', useful_const
defsysv, '!indef', -32768.
