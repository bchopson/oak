" Last Change: 2022 May 03

let g:oak#palette = {}
let g:oak#palette.trunk1  = '#1B140E'
let g:oak#palette.trunk2  = '#342212'
let g:oak#palette.trunk3  = '#593C22'
let g:oak#palette.trunk4  = '#AC9682'
let g:oak#palette.trunk5  = '#FEEFE1'
let g:oak#palette.fur1    = '#7A5454'
let g:oak#palette.fur2    = '#A58A86'
let g:oak#palette.fur3    = '#FF9F76'
let g:oak#palette.fur4    = '#D69060'
let g:oak#palette.leaf1   = '#B990D5'
let g:oak#palette.leaf2   = '#2CD3A4'
let g:oak#palette.leaf3   = '#59DCB7'
let g:oak#palette.petal1  = '#FF7373'
let g:oak#palette.petal2  = '#F0C54C'

function! s:orNONE(str)
  return len(a:str) > 0 ? a:str : 'NONE'
endfunction

function! oak#hi(group, fg, ...) " bg, attrs
  let l:fg = s:orNONE(a:fg)
  let l:bg = s:orNONE(get(a:, 1, ''))
  let l:attrs = s:orNONE(get(a:, 2, ''))

  let l:hl_string = [
        \ 'highlight', a:group,
        \ 'guifg=' . l:fg,
        \ 'guibg=' . l:bg,
        \ 'gui=' . l:attrs,
        \]

  execute join(l:hl_string, ' ')
endfunction

" Last Change: 2021 Sep 08

function! oak#StatusLineActive()
    let l:status = "%-6.{mode(6)}\ "
    let l:status .= "%<%.50f%m\ "
    let l:status .= "%y%q%w"
    let l:status .= "%="
    let l:status .= "%-20.(%8.{get(b:,'gitsigns_head','')}%12.{get(b:,'gitsigns_status','')}%)\ "
    let l:status .= "%16.(%10.(%l/%LL%),\ %-5.(%c%V%)%)"
    let l:status .= "\ %10.P"

    return l:status
endfunction


function! oak#StatusLineInactive()
    return "\ \ \ \ \ \ \ %<%.50f%m\ %y%q%w"
endfunction
