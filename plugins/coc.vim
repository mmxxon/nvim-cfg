let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ 'coc-markdownlint',
			\ 'coc-json',
      \ 'coc-python',
      \ 'coc-sh',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-tsserver',
      \ 'coc-rust-analyzer',
      \ 'coc-cmake',
      \ 'coc-tabnine',
      \ 'coc-snippets',
      \ 'coc-syntax',
			\ 'coc-conventional',
      \ 'coc-highlight',
      \ 'coc-bookmark',
      \ 'coc-actions',
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-yank',
      \ 'coc-tag',
			\ 'coc-db',
      \ ]
      "\ 'coc-ultisnips',
let g:coc_explorer_global_presets = {
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Abbreviations
cnoreabbrev ca call CocAction(
cnoreabbrev cc CocCommand
cnoreabbrev co CocConfig
cnoreabbrev cl CocList
cnoreabbrev cp CocUpdate
cnoreabbrev cu CocUninstall
cnoreabbrev caa call CocActionAsync(

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') -1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()

inoremap <silent><expr> <S-Tab>
  \ pumvisible() ? "\<C-p>" :
  \ <SID>check_back_space() ? "\<S-Tab>" :
  \ coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                             \: "\<C-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <a-a> <Plug>(coc-range-select)
xmap <silent> <a-a> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

nnoremap <silent><Leader>i  :<C-u>CocList diagnostics<cr>
nnoremap <silent><Leader>j  :<C-u>CocNext<cr>
nnoremap <silent><Leader>k  :<C-u>CocPrev<cr>
nnoremap <silent><Leader>r  :<C-u>CocListResume<cr>
nnoremap <silent><Leader>x  :<C-u>CocList extensions<cr>
nnoremap <silent><Leader>cm :<C-u>CocList commands<cr>
nnoremap <silent><Leader>co :<C-u>CocList commits<cr>
nnoremap <silent><Leader>ol  :<C-u>CocList outline<cr>
nnoremap <silent><Leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><Leader>m  :<C-u>CocList marketplace<cr>
nnoremap <silent><Leader>b  :<C-u>CocList bookmark<cr>
nnoremap <silent><Leader>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent><Leader>e  :<C-u>CocCommand explorer<cr>
nnoremap <silent><Leader>l  :<C-u>CocCommand explorer --preset floatingLeftside<cr>

nnoremap <silent>mm :<C-u>CocCommand bookmark.toggle<cr>
nnoremap <silent>ma :<C-u>CocCommand bookmark.annotate<cr>
nnoremap <silent>mx :<C-u>CocCommand bookmark.clearForCurrentFile<cr>
nnoremap <silent>m<Space> :<C-u>CocCommand bookmark.clearForAllFiles<cr>

nmap <leader>ac   <Plug>(coc-codeaction)
nmap <leader>qf   <Plug>(coc-fix-current)
nmap <leader>f    <Plug>(coc-format)
vmap <leader>f    <Plug>(coc-format-selected)
nmap <leader>rn   <Plug>(coc-rename)
nmap <leader>gs   <Plug>(coc-git-chunkinfo)
nmap <leader>gc   <Plug>(coc-git-commit)
nmap <silent><leader><leader> <Plug>(coc-action-openlink)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [b  <Plug>(coc-bookmark-prev)
nmap <silent> ]b  <Plug>(coc-bookmark-next)
" navigate chunks of current buffer
nmap <silent> [g  <Plug>(coc-git-prevchunk)
nmap <silent> ]g  <Plug>(coc-git-nextchunk)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<cr>
nnoremap <nowait><expr><c-j> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<c-j>"
nnoremap <nowait><expr><c-k> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<c-k>"
nnoremap <nowait><expr><esc> coc#float#has_float() ?
			\ coc#float#close(coc#float#get_float_win()) : "\<esc>"

