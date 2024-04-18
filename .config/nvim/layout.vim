let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +0 term://~//817207:/bin/bash
badd +0 term://~//818577:/bin/bash
badd +0 term://~//826728:/bin/bash
argglobal
%argdel
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe '1resize ' . ((&lines * 52 + 33) / 67)
exe 'vert 1resize ' . ((&columns * 169 + 120) / 240)
exe '2resize ' . ((&lines * 12 + 33) / 67)
exe 'vert 2resize ' . ((&columns * 169 + 120) / 240)
exe '3resize ' . ((&lines * 12 + 33) / 67)
exe 'vert 3resize ' . ((&columns * 20 + 120) / 240)
exe '4resize ' . ((&lines * 12 + 33) / 67)
exe 'vert 4resize ' . ((&columns * 49 + 120) / 240)
exe '5resize ' . ((&lines * 52 + 33) / 67)
exe 'vert 5resize ' . ((&columns * 70 + 120) / 240)
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~
wincmd w
argglobal
enew
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
lcd ~
wincmd w
argglobal
if bufexists(fnamemodify("term://~//818577:/bin/bash", ":p")) | buffer term://~//818577:/bin/bash | else | edit term://~//818577:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~//818577:/bin/bash
  "Terminal battery"
  set nonumber
  set norelativenumber
  call chansend(3,"terminal-battery-indicator\n")
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 14 - ((11 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
normal! 0
lcd ~
wincmd w
argglobal
if bufexists(fnamemodify("term://~//817207:/bin/bash", ":p")) | buffer term://~//817207:/bin/bash | else | edit term://~//817207:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~//817207:/bin/bash
  "shit for clock"
  set nonumber
  set norelativenumber
  call chansend(4,"bigtime --rainbow\n")
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 6) / 12)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 034|
lcd ~
wincmd w
argglobal
if bufexists(fnamemodify("term://~//826728:/bin/bash", ":p")) | buffer term://~//826728:/bin/bash | else | edit term://~//826728:/bin/bash | endif
if &buftype ==# 'terminal'
  silent file term://~//826728:/bin/bash
  "lower right terminal"
  set nonumber
  set norelativenumber
  call chansend(5,"neofetch\n")
endif
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 26) / 52)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~
wincmd w
exe '1resize ' . ((&lines * 52 + 33) / 67)
exe 'vert 1resize ' . ((&columns * 169 + 120) / 240)
exe '2resize ' . ((&lines * 12 + 33) / 67)
exe 'vert 2resize ' . ((&columns * 169 + 120) / 240)
exe '3resize ' . ((&lines * 12 + 33) / 67)
exe 'vert 3resize ' . ((&columns * 20 + 120) / 240)
exe '4resize ' . ((&lines * 12 + 33) / 67)
exe 'vert 4resize ' . ((&columns * 49 + 120) / 240)
exe '5resize ' . ((&lines * 52 + 33) / 67)
exe 'vert 5resize ' . ((&columns * 70 + 120) / 240)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :


