" Vim indent file
" Language: Fauna Schema Language (FSL)
" Maintainer: Jared Tyler Miller
" Latest Revision: 2024-07-14

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetFSLIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O,e
setlocal autoindent sw=2 ts=2 expandtab

function! GetFSLIndent()
  let lnum = prevnonblank(v:lnum - 1)
  if lnum == 0
    return 0
  endif

  let ind = indent(lnum)
  let prevline = getline(lnum)

  if prevline =~ '{$'
    let ind += &sw
  endif

  if getline(v:lnum) =~ '^\s*[})\]]'
    let ind -= &sw
  endif

  return ind
endfunction

