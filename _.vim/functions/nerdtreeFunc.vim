" fix nerdTree width
function! NerdTreeWidth()
    :exe "normal30\<C-W>|"
endf

" return if NerdTree is open/acitve
function! rc:isNTOpen()
   return exists("t:NERDTreeBufName") && (bufwinnr("t:NERDTreeBufName") != -1)
endfunction

"call NERDTreeFind if NERDTree is active
function! rc:syncTree()
    if &modifiable && rc:isNTOpen() && strlen(expand('%')) > 0 && !&diff
      :exe NERDTreeFind
      wincmd p
    endif
endfunction

autocmd BufEnter * call rc:syncTree()
