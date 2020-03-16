set number
set laststatus=2
set showmode
set cursorline
syntax enable
set hlsearch
set smartindent
"status line"

set statusline=%F
set statusline+=%m

set statusline+=%=
set statusline+=[ENC=%{&fileencoding}]
set statusline+=[LOW=%l/%L]

