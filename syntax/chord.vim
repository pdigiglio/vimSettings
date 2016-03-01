" Vim syntax file
" Language: Music chords
" Maintainer: Paolo Di Giglio (p.digiglio91@gmail.com)
" Created: Thu 04 Dec 2014 03:35:16 PM CET

" check if a syntax file already exists
if exists("b:current_syntax")
  finish
endif

" TODO # are not matched
"syn match celComment '.*#\S*' contains=celTodo
"syn match celComment '\v#' contains=celTodo
syn match celComment '[A-G]\([0-9bm+\v#X]\+\)' contains=celTodo
syn match celComment '[A-G]\([b#X]\{0,1}\)sus\(\d\+\)' contains=celTodo
syn match celComment '[A-G]\([b#X]\{0,1}\)dim\(\d\+\)' contains=celTodo
syn keyword chords A B C D E F G

" match tabs
syn match tabs "|.\+|"

"syn match var '[b#]' contained
"syn keyword chords B nextgroup=var

"syn match var 'sus\(\d\*\)'
"syn keyword chords A Ab A# nextgroup=var
"syn keyword chords B Bb B# nextgroup=var
"syn keyword chords C Cb C# nextgroup=var
"syn keyword chords D Db D# nextgroup=var
"syn keyword chords E Eb E# nextgroup=var
"syn keyword chords F Fb F# nextgroup=var
"syn keyword chords G Gb G# nextgroup=var

let b:current_syntax = "chord"

"hi def link chords	Constant
hi def link celdo		Statement
hi def link celComment		Statement
hi def link tabs	PreProc
