scriptencoding utf-8

"余計な空白と最終行の空白を保存時自動削除
autocmd BufWritePre * call s:remove_unnecessary_space()

function! s:remove_unnecessary_space()
    " delete last spaces
    %s/\s\+$//ge

    " delete last blank lines
    while getline('$') == ""
        $delete _
    endwhile
endfunction