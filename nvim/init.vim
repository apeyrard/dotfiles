call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'iCyMind/NeoSolarized'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'itmammoth/doorboy.vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'kshenoy/vim-signature'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'bling/vim-bufferline'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'majutsushi/tagbar'

call plug#end()



" Neovim settings
set termguicolors
colorscheme NeoSolarized
set background=dark
set pastetoggle=<F6>
set nopaste
set number
set numberwidth=1
set undofile
set undodir="$HOME/.VIM_UNDO_FILES"
" Deoplete

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#rust#racer_binary='/home/alex/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/alex/rust/src'
let g:deoplete#sources#rust#show_duplicates=1

" undotree
nnoremap <F5> :UndotreeToggle<cr>

" Git
set signcolumn=yes

" tagbar

nmap <F8> :TagbarToggle<CR>
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}
