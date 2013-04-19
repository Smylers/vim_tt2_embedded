" syntax/tt2_embedded.vim
" 
" Highlight Template Toolkit tags embedded in some other syntax, which has
" already been loaded.


" tt2.vim does Template Toolkit syntax highlighting, but not if another syntax
" has already been loaded. So deny that that has happened (saving which syntax
" it is for later):
let s:main_syntax = b:current_syntax
unlet b:current_syntax

runtime! syntax/tt2.vim

" Restore the indication of what the main syntax is:
let b:current_syntax = s:main_syntax

" Special preprocessor integration with the HTML syntax (see :help html.vim):
if b:current_syntax == 'html'
  syntax cluster htmlPreProc add=@tt2_top_cluster
endif
