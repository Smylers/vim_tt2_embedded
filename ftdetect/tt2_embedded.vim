" ftdetect/tt2_embedded.vim
"
" Enable syntax highlighting for Template Toolkit tags inside some other syntax
" on files that have '.tt' before their main extension (which has already been
" used to set the main filetype).


" Don't use setfiletype, because we don't want the filetype to change, and we
" don't want to clear what's already been set. Instead just load the relevant
" syntax highlighting:
autocmd! BufRead,BufNewFile *.tt.* runtime! syntax/tt2_embedded.vim
