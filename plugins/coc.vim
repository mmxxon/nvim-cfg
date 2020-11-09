let g:coc_global_extensions = [
      \ 'coc-actions',
      \ 'coc-floaterm',
			\ 'coc-bookmark',
      \ 'coc-snippets',
      \ 'coc-syntax',
      \ 'coc-highlight',
      \ 'coc-explorer',
      \ 'coc-git',
      \ 'coc-yank',
      \ 'coc-tabnine',
      \ 'coc-python',
      \ 'coc-cmake',
			\ 'coc-json',
      \ 'coc-sh',
			\ 'coc-conventional',
			\ 'coc-db',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-vimlsp',
      \ 'coc-rust-analyzer',
      \ 'coc-tag',
      \ ]
      "\ 'coc-ultisnips',
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

" Abbreviations
cnoreabbrev ca call CocAction(
cnoreabbrev cc CocCommand
cnoreabbrev co CocConfig
cnoreabbrev cl CocList
cnoreabbrev cp CocUpdate
cnoreabbrev cu CocUninstall
cnoreabbrev caa CocActionAsync

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
                             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

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

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" Mappings for CoCList
nnoremap <silent><Leader>j  :<C-u>CocNext<CR>
nnoremap <silent><Leader>k  :<C-u>CocPrev<CR>
nnoremap <silent><Leader>p  :<C-u>CocListResume<CR>
nnoremap <silent><Leader>di  :<C-u>CocList diagnostics<cr>
nnoremap <silent><Leader>e  :<C-u>CocList extensions<cr>
nnoremap <silent><Leader>cm :<C-u>CocList commands<cr>
nnoremap <silent><Leader>co :<C-u>CocList commits<CR>
nnoremap <silent><Leader>o  :<C-u>CocList outline<cr>
nnoremap <silent><Leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><Leader>m  :<C-u>CocList marketplace<cr>
nnoremap <silent><Leader>y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent><Leader>e  :<C-u>CocCommand explorer<cr>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <nowait><expr><c-j> coc#float#has_scroll() ? coc#float#scroll(1, 3) : "\<c-j>"
nnoremap <nowait><expr><c-k> coc#float#has_scroll() ? coc#float#scroll(0, 3) : "\<c-k>"
nnoremap <nowait><expr><esc> coc#float#has_float() ?
			\ coc#float#close(coc#float#get_float_win()) : "\<esc>"

