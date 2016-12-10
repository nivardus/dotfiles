execute pathogen#infect()
colorscheme monokai
set hlsearch
set number

let mapleader=','
let g:ctrlp_map = '<c-p>'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|vendor$\|node_modules$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
