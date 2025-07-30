if exists("g:loaded_hello")
    finish
endif
let g:loaded_hello = 1

if !exists("g:hello_quit_sleep_time")
    let g:hello_quit_sleep_time = 1000
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
    echo g:hello_greetings[rand() % len(g:hello_greetings)]
endfunction

function! SayGoodbye()
    echo g:hello_goodbyes[rand() % len(g:hello_goodbyes)]
    execute "sleep " . g:hello_quit_sleep_time . "m"
endfunction

function! SayGoodbye2()
    echo g:hello_goodbyes[rand() % len(g:hello_goodbyes)]
endfunction

command! SayHello call SayHello()
command! SayGoodbye call SayGoodbye2()

autocmd VimEnter * :call SayHello()
autocmd VimLeave * :call SayGoodbye()