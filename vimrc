execute pathogen#infect()
colorscheme monokai

set hlsearch
set number
set mouse=a
set shell=zsh\ -i

let mapleader=','
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|vendor$\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" matchit, better %
runtime macros/matchit.vim

" strip trailing whitespace
function! StripWhitespace ()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

" trialing white space (strip spaces)
noremap <leader>ss :call StripWhitespace()<CR>
