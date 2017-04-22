execute pathogen#infect()
colorscheme monokai

set swapfile
set dir=~/tmp

set hlsearch
set number
set mouse=a

let mapleader=','

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" ctrlp configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|vendor$\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

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

" allow jsx syntax highlighting in all *.js files
let g:jsx_ext_required = 0
