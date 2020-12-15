" Coc
command! Docthis		  :silent! call CocActionAsync('runCommand', 'docthis.documentThis')
command! EsConfig	    :silent! call CocActionAsync('runCommand', 'eslint.createConfig')
command! EsFix  			:silent! call CocActionAsync('runCommand', 'eslint.executeAutofix')
command! Fold			    :silent! call     CocAction('fold', <f-args>)
command! Format		    :silent! call CocAction('format')
command! Or				    :silent! call     CocAction('runCommand', 'editor.action.organizeImport')

command! Jest         :silent! call  CocActionAsync('runCommand', 'jest.projectTest')
command! JestCurrent  :silent! call  CocActionAsync('runCommand', 'jest.fileTest', ['%'])
command! JestInit     :silent! call CocActionAsync('runCommand', 'jest.init')

command! PostNew      :silent! call CocActionAsync('runCommand', 'post.new')
command! Post         :silent! call CocActionAsync('runCommand', 'post.do')
command! -bar -nargs=1 VimSpectorLoadTemplate
  \ :silent! execute "0r ".g:vimspector_json_path.<q-args>
command! -bang -nargs=* VimSpectorLoadJson :silent! call fzf#run({
  \   'source': 'ls ' . vimspector_json_path,
  \   'sink': 'e .vimspector.json | VimSpectorLoadTemplate',
  \   'down': '25%',
  \   'options': '--preview-window=hidden'
  \ })
