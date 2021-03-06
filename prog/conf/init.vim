" ============================================================================
"               vim-plug установится при первом старте nVim'а
" ============================================================================
if empty(glob("~/.config/nvim/autoload/plug.vim"))
    execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

" ============================================================================
"                           Плагины nVIM
" ============================================================================
call plug#begin('~/.config/nvim/bundle')
Plug 'scrooloose/nerdtree' " Отображения дерева каталога
Plug 'ErichDonGubler/vim-sublime-monokai' " Цветовая тема
Plug 'vim-airline/vim-airline' " Улучшенная строка состояния status bar
Plug 'vim-airline/vim-airline-themes' " Темы status bar
Plug 'ryanoasis/vim-devicons' " Шрифт и иконки NERDtree.
Plug 'neomake/neomake'  "
Plug 'Shougo/neocomplcache' " Для выполнения заполнения ключевых слов путем создания кэша ключевых слов в буфере
Plug 'Shougo/vimshell'  " Для выполнения заполнения ключевых слов в SHELL
Plug 'airblade/vim-gitgutter'   " Показывает, какие строки были добавлены, изменены или удалены
Plug 'tpope/vim-fugitive'   " Главный плагин Vim для Git
call plug#end()

" ============================================================================
"                           Настройки редактора
" ============================================================================
set nopaste                 " Режим без принудительной вставки отступов
set modifiable              " Сделает буфер модифицируемым
set noautowrite             " Не автосохранять                             
set ignorecase              " Игнорировать регистр букв при поиске
set nobackup                " Без автоматического создания файлов отмены
set noswapfile              " Не создаём swp-файлы
set fileformat=unix         " Формат файла (влияет на окончание строк) 
set fencs=utf8,cp1251       " Автоопределение кодировки
set nocompatible            " режим совместимости с Vi отключён
set hidden
set encoding=utf-8
set backspace=indent,eol,start      " Исправить «неработающий» backspace в режиме вставки
set path+=**                " Для поиска во всех подкаталогах
set wrap linebreak nolist   " Данная вариация работает как wrap...но переносит строчки не посимвольно, а по словам
set inccommand=split      " Подсветка поиска-замены
"set inccommand=nosplit      " Подсветка поиска-замены

" ====== GitGutter =====
"set signcolumn=yes " Показать всегда столбец со знаком
set updatetime=100
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_added = '++'
let g:gitgutter_sign_modified = '+-'
let g:gitgutter_sign_removed = '--'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_removed_above_and_below = '{'
"let g:gitgutter_sign_modified_removed = 'ww'
" ============================================================================
"                           Neocomplcache
" ============================================================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" ============================================================================
"                     Настройки внешнего вида  редактора
" ============================================================================
"set number relativenumber                " Нумерация строк
set number                " Нумерация строк
"set textwidth=80            " Ширина текста - 80 симполов
"set colorcolumn=80          " Подсветка того,что вылезает за 80 символов
set cursorline              " подсвечивать строку с курсором
colorscheme sublimemonokai  " Цветовая тема

" Строка состояния AirLine
set laststatus=2 
let g:airline_theme='bubblegum' " Цветовая тема строки состояния status bar
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1 "Автоматически отображает все буферы
let g:airline_skip_empty_sections = 1   "Не рисовать разделители для пустых разделов

" NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" ============================================================================
"                   Редактирование и навигация по коду
" ============================================================================
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set autoindent              " Автоматический отступ
set smartindent             " Умные отступы (например, автоотступ после {)
set tabstop=4               " Пробелами 
set shiftwidth=4            " По 4 штуки
set softtabstop=4
set expandtab               " Заменять табы на пробелы и обратно                    
set showmatch               " Показывать первую парную скобку после ввода второй
set mps+=<:>                " показывать совпадающие скобки для HTML-тегов
set mps+=(:)                " показывать совпадающие скобки для HTML-тегов
set mps+={:}                " показывать совпадающие скобки для HTML-тегов
set mps+=[:]                " показывать совпадающие скобки для HTML-тегов
set mps+=':'                " показывать совпадающие скобки для HTML-тегов
set mps+=":"                " показывать совпадающие скобки для HTML-тегов
set foldmethod=manual       " Выделяем участок с помощью v
syntax on                   " Подсветка синтаксиса

" для изменения курсора в разных режимах используйте это:
set ttimeoutlen=10          "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q"         "SI = режим вставки
let &t_SR.="\e[3 q"         "SR = режим замены
let &t_EI.="\e[1 q"         "EI = нормальный режим
"Где 1 - это мигающий прямоугольник
"2 - обычный прямоугольник
"3 - мигающее подчёркивание
"4 - просто подчёркивание
"5 - мигающая вертикальная черта
"6 - просто вертикальная черта

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set keymap=russian-jcukenwin    "Если вы используете обычную qwerty, то поменяте mac на win
set iminsert=0  "Язык ввода при старте nVim - Английский
set imsearch=0  "Аналогично настраивается режим поиска
"set spell spelllang=ru,en  " Языки проверки орфографии
set nospell                 " По умолчанию - без проверки орфографии
set wildmenu                " при нажатии Tab в командном режиме для авто дополнения варианты будут отображаться в меню, а не появляться по-одному.
set wcm=<Tab>               " Кодировки выбираются через меню

" ============================================================================
"                                  Меню
"   * Кодировка файла
"   * Вкл/Откл автодополнения ввода
" ============================================================================
nmap <F12> :emenu <tab>
imap <F12> <Esc>:emenu <tab>
menu Encoding.CP1251   :e ++enc=cp1251<cr>
menu Encoding.CP866    :e ++enc=cp866<cr>
menu Encoding.UTF-8    :e ++enc=utf-8<cr>
menu Encoding.KOI8-U   :e ++enc=koi8-u<cr>
menu Autocomplete.Off  :NeoComplCacheDisable<cr>
menu Autocomplete.On   :NeoComplCacheEnable<cr>

" ============================================================================
"                                  Файл 
"   F1 - Для отображения дерева каталога
"   F2 - сохранить
"   F4 - Замена в файле
"   Ctrl + F - поиск в открытом буфере
"   Ctrl + F2 - Сохранить если не хватает прав
"   F8 - make
"   Ctrl+F10 - выйти
"   Ctrl+z - отмена
"   Ctrl+y - отмена отмены
" ============================================================================
" Для отображения/скрытия NERDTreeToggle
nmap <F1> :NERDTreeToggle<cr>
imap <F1> <Esc>:NERDTreeToggle<cr>

" Сохранить
nmap <F2> :w<cr>                        
imap <F2> <Esc>:w<cr>i

" Замена в открытом буфере
imap <F4> <Esc>:%s///<left><left>
nmap <F4> :%s///<left><left>

" Ctrl + F Поиск в открытом буфере
imap <C-f> <Esc>/
nmap <C-f> <Esc>/

" Ctrl + F2 охранить если не хватает прав
nmap <C-F2> :w !sudo tee %<cr>                        
imap <C-F2> <Esc>:w !sudo tee %<cr>i

" F8 - make
map <F8> :make<cr>
imap <F8> <Esc>:make<cr>

" Ctrl+F10 - выйти
map <C-F10> :q<cr>
imap <C-F10> <Esc>:q<cr>

" Ctrl+z - отмена
map <C-z> u
imap <C-z> <Esc>u

" Ctrl+y - отмена отмены
map <C-y> <C-r>
imap <C-y> <Esc><C-r>

" ============================================================================
"                                  Окна 
"   * Ctrl + rigth - окно вправо
"   * Ctrl + left - окно влево 
"   * Ctrl + up - окно вверх 
"   * Ctrl + down - окно вниз 
" ============================================================================
" Перемещение по окнам
map <C-right> <C-w>l    
map <C-left> <C-w>h
map <C-up> <C-w>k
map <C-down> <C-w>j

imap <C-right> <C-w>l
imap <C-left> <C-w>h
imap <C-up> <C-w>k
imap <C-down> <C-w>j

" ============================================================================
"                                   Табы
"   * Alt + right - следующий таб
"   * Alt + left - следующий таб
"   * Alt + up - Новый таб
"   * Alt + down - Закрыть таб
" ============================================================================
map <A-right> :tabn<cr>
map <A-left> :tabp<cr>
imap <A-right> <Esc>:tabn<cr>i
imap <A-left> <Esc>:tabp<cr>i
map <A-up> :tabnew<cr>
map <A-down> :tabclose<cr>i

" ============================================================================
"                                   Скобки
" ============================================================================
" Автоматическое закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
imap < <><LEFT>
" ============================================================================
"                                   END
" ============================================================================
