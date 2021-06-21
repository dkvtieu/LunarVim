""" OPTIONS

" Allow mouse interaction with vim while in a tmux session
    set mouse=a

" Do not retain swap files or backups. Instead retain undo history
    set noswapfile
    set nobackup
    set undofile
    set undodir=$HOME/.vim/undodir

" Setting both 'number' and 'relativenumber' enables hybrid line numbers
    set number relativenumber

" Turning on ruler for cursor position
    set ruler

" Perform case-sensitive search if capital letters are included in pattern
    set ignorecase smartcase

" Line character rulers. Soft limit and hard limit
    set colorcolumn=120
    highlight ColorColumn ctermbg=grey guibg=grey

" Hide files in buffer when quitting
    set hidden

" Highlight matches as search is being made
    set incsearch

" Enable global replacement (i.e. no need to do /g with every :substitute)
" WARNING: This may break some plugins
    set gdefault

" Substitute preview
    set inccommand=nosplit

""" KEYMAPPINGS

" Reload or edit neovim config
    nnoremap <leader>vr :source $HOME/.config/nvim/init.vim<cr>
    nnoremap <leader>ve :e $HOME/.config/nvim/init.vim<cr>

" Clear highlighting
    nnoremap <leader><space> :noh<cr>

" Highlight all matching words and change
    nnoremap cn *``cgn
    nnoremap cN *``cgN

" UndoTree
    nnoremap <leader>u :UndotreeShow<cr>

" Window resizing
    nnoremap <Leader>= :vertical resize +5<CR>
    nnoremap <Leader>- :vertical resize -5<CR>
    nnoremap <Leader>+ :resize +5<CR>
    nnoremap <Leader>_ :resize -5<CR>

""" FUNCTIONS

" Execute macro over visual selection block
    xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction


" Auto trim trailing whitespace
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun

    autocmd BufWritePre * :call TrimWhitespace()

" camelcasemotion
    let g:camelcasemotion_key = '<leader>'


" Vimdiff mappings
    nmap <leader>dgh :diffget //2<CR>
    nmap <leader>dgl :diffget //3<CR>

" Auto delete vim-fugitive buffers when quitting
    autocmd BufReadPost fugitive://* set bufhidden=delete

" Telescope.nvim
    nnoremap <leader>pp :lua require('telescope.builtin').git_files()<CR>
    nnoremap <leader>pP :lua require('telescope.builtin').find_files()<CR>
    nnoremap <leader>pf :lua require('telescope.builtin').live_grep()<CR>
    nnoremap <leader>pgb :lua require('telescope.builtin').git_branches()<CR>
    nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
    nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
    nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
    nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>


    unmap  <leader>p
