scriptencoding utf-8

autocmd BufWritePre * call s:remove_unnecessary_space()

let g:abo_popup_display_time = get(g:, 'abo_popup_display_time', 1500)

function! s:remove_unnecessary_space()
    " delete last spaces
    %s/\s\+$//ge

    " delete last blank lines
    while getline('$') == ""
        $delete _
    endwhile

    " popup
    if exists('g:abo_popup_msg')
        let s:winid = popup_create(g:abo_popup_msg, {"moved": "any", "border": [1,1,1,1]})
        call timer_start(g:abo_popup_display_time, function("s:clear_popup"))
    endif
endfunction

function! s:clear_popup(timer)
    call popup_close(s:winid)
endfunction
