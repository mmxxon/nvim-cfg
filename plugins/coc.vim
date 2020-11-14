" Coc extensions {{{
let g:coc_global_extensions = [
      \ 'coc-jest',
      \ 'coc-angular',
      \ 'coc-react-refactor',
      \ 'coc-postfix',
      \ 'coc-toml',
      \ 'coc-fzf-preview',
      \ 'coc-fs-lists',
      \ 'coc-diagnostic',
      \ 'coc-style-helper',
      \ 'coc-scssmodules',
      \ 'coc-css',
      \ 'coc-import-cost',
      \ 'coc-markdownlint',
			\ 'coc-json',
      \ 'coc-python',
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
      \ 'coc-gitignore',
      \ 'coc-git',
      \ 'coc-yank',
      \ 'coc-tag',
      \ 'coc-sql',
			\ 'coc-db',
      \ 'coc-post',
      \ 'coc-lists',
      \ 'coc-restclient',
			\ 'coc-eslint',
			\ 'coc-docthis'
      \ ]
      "\ 'coc-ultisnips',
" }}}
" Explorer presets {{{
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
" }}}
" Abbreviations {{{
cnoreabbrev ca call CocAction(
cnoreabbrev cc CocCommand
cnoreabbrev co CocConfig
cnoreabbrev cl CocList
cnoreabbrev cp CocUpdate
cnoreabbrev cu CocUninstall
cnoreabbrev caa call CocActionAsync(
" }}}
" Completion hooks {{{
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

inoremap <silent><expr> <c-space> coc#refresh()
" }}}

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

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

nnoremap <silent><Leader>b	:CocList buffers<cr>
nnoremap <silent><Leader>c	:CocList commits<cr>
nnoremap <silent><Leader>C	:CocList commands<cr>
nnoremap <silent><Leader>e  :CocCommand explorer<cr>
nnoremap <silent><Leader>E  :CocCommand explorer --preset floating<cr>
nnoremap <silent><Leader>i  :CocList diagnostics<cr>
nnoremap <silent><Leader>j  :CocNext<cr>
nnoremap <silent><Leader>k  :CocPrev<cr>
nnoremap <silent><Leader>m  :CocList bookmark<cr>
nnoremap <silent><Leader>M  :CocList marketplace<cr>
nnoremap <silent><Leader>o  :CocList outline<cr>
nnoremap <silent><Leader>p  :CocListResume<cr>
nnoremap <silent><Leader>r  :CocCommand explorer --preset floatingRightside<cr>
nnoremap <silent><Leader>s  :CocList -I symbols<cr>
nnoremap <silent><Leader>x  :CocList extensions<cr>
nnoremap <silent><Leader>y  :CocList -A --normal yank<cr>

nnoremap <silent>mm :CocCommand bookmark.toggle<cr>
nnoremap <silent>ma :CocCommand bookmark.annotate<cr>
nnoremap <silent>mx :CocCommand bookmark.clearForCurrentFile<cr>
nnoremap <silent>m<Space> :CocCommand bookmark.clearForAllFiles<cr>

nmap <silent><leader>ac   <Plug>(coc-codeaction)
nmap <silent><leader>qf   <Plug>(coc-fix-current)
nmap <silent><leader>f    <Plug>(coc-format)
vmap <silent><leader>f    <Plug>(coc-format-selected)
nmap <silent><leader>rn   <Plug>(coc-rename)
nmap <silent><leader>gs   <Plug>(coc-git-chunkinfo)
nmap <silent><leader>gc   <Plug>(coc-git-commit)

nmap ' [fzf-p]
xmap ' [fzf-p]
nnoremap <silent> [fzf-p]g      :CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b      :CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B      :CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]c      :CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]j      :CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]l      :CocCommand fzf-preview.LocationList<CR>
nnoremap <silent> [fzf-p]o      :CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]p      :CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]q      :CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]t      :CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]T      :CocCommand fzf-preview.VistaCtags<CR>

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <silent> <a-a> <Plug>(coc-range-select)
xmap <silent> <a-a> <Plug>(coc-range-select)

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

command! Jest :call  CocActionAsync('runCommand', 'jest.projectTest')
command! JestCurrent :call  CocActionAsync('runCommand', 'jest.fileTest', ['%'])
command! JestInit :call CocActionAsync('runCommand', 'jest.init')
nnoremap <leader>T :call CocActionAsync('runCommand', 'jest.singleTest')<CR>

command! PostNew :call CocActionAsync('runCommand', 'post.new')
command! Post :call CocActionAsync('runCommand', 'post.do')

command! -nargs=0 Format		:call CocAction('format')
command! -nargs=? Fold			:call     CocAction('fold', <f-args>)
command! -nargs=0 Or				:call     CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 EsFix			:call CocActionAsync('runCommand', 'eslint.executeAutofix')
command! -nargs=0 EsConfig	:call CocActionAsync('runCommand', 'eslint.createConfig')
command! -nargs=0 Doctis		:call CocActionAsync('runCommand', 'docthis.documentThis')


" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
