if exists("g:loaded_hello")
    finish
endif
let g:loaded_hello = 1

if !exists("g:hello_quit_sleep_time")
    let g:hello_quit_sleep_time = 1000
endif

if !exists("g:hello_enable_emoji")
    let g:hello_enable_emoji = 1
endif

let g:hello_greetings = ["What a good day!", "Hi!", "Have a good time!", "Hello!"]
let g:hello_goodbyes = ["See you later!", "Catch you later!", "Goodbye!", "Have a good day!", "Bye!"]

if exists("g:hello_custom_greetings")
    let g:hello_greetings = g:hello_greetings + g:hello_custom_greetings
endif

if exists("g:hello_custom_goodbyes")
    let g:hello_goodbyes = g:hello_goodbyes + g:hello_custom_goodbyes
endif

function! SayHello()
    let str = g:hello_greetings[rand() % len(g:hello_greetings)]
    if g:hello_enable_emoji
        let str = str . "😀"
    endif
    echo str
endfunction

function! SayGoodbye()
    let str = g:hello_goodbyes[rand() % len(g:hello_goodbyes)]
    if g:hello_enable_emoji
        let str = str . "😀"
    endif
    echo str
    execute "sleep " . g:hello_quit_sleep_time . "m"
endfunction

function! SayGoodbye2()
    let str = g:hello_goodbyes[rand() % len(g:hello_goodbyes)]
    if g:hello_enable_emoji
        let str = str . "😀"
    endif
    echo str
endfunction

command! SayHello call SayHello()
command! SayGoodbye call SayGoodbye2()

autocmd VimEnter * :call SayHello()
autocmd VimLeave * :call SayGoodbye()
