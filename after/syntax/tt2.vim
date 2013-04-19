" after/syntax/tt2.vim
"
" Set a background colour on TT tags. This is particularly useful when there is
" syntax highlighting for both TT and the underlying filetype.


" This involves individually redefining each of the highlight groups used:
for group in ['comment', 'commentblock_Region', 'string_q', 'string_qq',
  \ 'blockname', 'number', 'func', 'ivariable', 'directive', 'operator',
  \ 'tag_region', 'tag', 'variable', 'bracket_r', 'bracket_c', 'bracket_b',
  \ 'deref']
  let group = 'tt2_' . group

  " Set a pale blue-grey background, so normal colours can be seen on top of
  " it. Don't run the command yet, because doing so will lose the current
  " highlighting:
  let cmd = 'highlight ' . group . ' ctermbg=lightgrey guibg=#DDEDEA'

  " By default the highlight group is linked to a standard group, which we
  " don't want to redefine. So we need to snap the link. For both terminal
  " types, find out which colour is currently used and whether the text is
  " bold:
  for term in ['cterm', 'gui']

    " If a text colour is specified, copy it to the new command to be run once
    " we've finished grabbing the current styles:
    let fg = synIDattr(synIDtrans(hlID(group)), 'fg', term)
    if fg != '' && fg != -1
      let cmd = cmd . ' ' . term . 'fg=' . fg
    endif

    " Ditto for bold:
    if synIDattr(synIDtrans(hlID(group)), 'bold', term)
      let cmd = cmd . ' ' . term . '=bold'
    endif
  endfor

  exe cmd
endfor
