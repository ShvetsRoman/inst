"=====================================================================
"               vim-plug установится при первом старте Vim'а
" ===========================================================================
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall
endif

" ===========================================================================
"                           B
"                           Плагины VIM
" ===========================================================================
call plug#begin('~/.vim/plugged')

" ========== Дерево каталога ==========

Plug 'scrooloose/nerdtree'	" Отображения дерева каталога
Plug 'jistr/vim-nerdtree-tabs'	"для работы в разных вкладках

" ========== Авто дополнение кода ===========
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

" ========== Для подсветки синтаксиса ==========
Plug 'sheerun/vim-polyglot'

" ========== Цветовые темы подсветки ==========
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'danilo-augusto/vim-afterglow'
Plug 'lfenzo/vim-fusion'
Plug 'MisanthropicBit/vim-warlock'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'srcery-colors/srcery-vim'
Plug 'lilydjwg/colorizer' " Показывает цвета RGB......

" ========== Airline ==========
Plug 'vim-airline/vim-airline'	" Улучшенная строка состояния status bar
Plug 'vim-airline/vim-airline-themes'	" Темы status bar
Plug 'ryanoasis/vim-devicons'	" Шрифт и иконки

" ========== PYTHON ==========
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'hynek/vim-python-pep8-indent'
Plug 'mitsuhiko/vim-python-combined'
Plug 'mitsuhiko/vim-jinja'
"Plug 'vim-python/python-syntax'
Plug 'jmcantrell/vim-virtualenv'	" User virtualenv for current python interpretor

" ========== отображения тонких вертикальных линий на каждом уровне отступа ==========
Plug 'Yggdroot/indentLine'

" ========== Cворачивание кода ==========
Plug 'tmhedberg/SimpylFold'		" Сворачивание кода
Plug 'Konfekt/FastFold'			" Нужно для сворачивания кода

call plug#end()

" ===========================================================================
"                           Настройки редактора
" ===========================================================================

packadd! dracula
syntax enable

set nopaste					" Режим без принудительной вставки отступов
"set modifiable				" Сделает буфер модифицируемым
set noautowrite				" Не автосохранять
set ignorecase				" Игнорировать регистр букв при поиске
set nobackup				" Без автоматического создания файлов отмены
set noswapfile				" Не создаём swp-файлы
set fileformat=unix			" Формат файла (влияет на окончание строк) 
set fencs=utf8,cp1251		" Автоопределение кодировки
set termencoding=utf-8		" Кодировка terminala UTF-8 
set encoding=utf-8			" Кодировка file UTF-8 
set nocompatible            " режим совместимости с Vi отключён
set backspace=indent,eol,start		" Исправить «неработающий» backspace в режиме вставки
set path+=**				" Для поиска во всех подкаталогах
"set incsearch				" Поиск в процессе набора
set hlsearch				" Подсвечивание результатов поиска
"set nowrap		" Не переносить строки
set wrap linebreak nolist	" Данная вариация работает как wrap...но переносит строчки не посимвольно, а по словам
set modifiable             " Разрешение на модификацию VIMa
set clipboard=unnamedplus   " Копирование и вставка в другии приложения
set hidden					" Не выгружать буфер, когда переключаемся на другой файл, это позволяет редактировать несколько файлов без save.

" ========== Сворачивание ==========
"zc     свернуть блок
"zo     развернуть блок
"zM     закрыть все блоки
"zR     открыть все блоки
"za     инвертирование
"zf     см :set foldmethod=manual

set foldenable				"включить свoрачивание

"set foldmethod=syntax		"сворачивание на основе синтаксиса
set foldmethod=indent		"сворачивание на основе отступов
set foldmethod=manual		"выделяем участок с помощью v и говорим zf
"set foldmethod=marker		"сворачивание на основе маркеров в тексте

let g:SimpylFold_docstring_preview = 1	" Предварительный просмотр строки документации в свернутом тексте

set foldmarker=bigin,end	"задаем маркеры начала и конца блока
set foldlevel=99
set foldlevelstart=1
set foldnestmax=2
set foldcolumn=0	" Полоса отображения свернутых/развернутых блоков
"set foldlevel=0	" Уровень сверачивания блоков по умолчанию
"set foldopen=all	" Автоматическое открытие сверток при заходе на них
"set foldclose=all	" Автоматическое закрытие сверток при уходе с них

" == Настройки сворачиваня FastFold ==
let javaScript_fold=1		" JavaScript
let perl_fold=1				" Perl
let php_folding=1			" PHP
let r_syntax_folding=1		" R
let ruby_fold=1				" Ruby
let sh_fold_enabled=1		" sh
let vimsyn_folding='af'		" Vim script
let xml_syntax_folding=1	" XML
"autocmd BufWinEnter * normal! zM	" Закрыть все блоки при откытии фыйла
autocmd BufWinEnter * normal! zR	" Открыть все блоки при откытии фыйла
nnoremap <space> za		" Работает по комбинации za. Меняю на пробел

" ===========================================================================
"                   Редактирование и навигация по коду
" ===========================================================================
set mousehide               "Спрятать курсор мыши когда набираем текст
set mouse=a                 "Включить поддержку мыши
set autoindent              " Автоматический отступ
set tabstop=4               " Пробелами
set shiftwidth=4            " По 4 штуки
set softtabstop=4
"set expandtab               " Заменять табы на пробелы и обратно
set smartindent             " Умные отступы (например, автоотступ после {)
set showmatch               " Показывать первую парную скобку после ввода второй
set mps+=<:>                " показывать совпадающие скобки для HTML-тегов
set mps+=(:)                " показывать совпадающие скобки для HTML-тегов
set mps+={:}                " показывать совпадающие скобки для HTML-тегов
set mps+=[:]                " показывать совпадающие скобки для HTML-тегов
set mps+=':'                " показывать совпадающие скобки для HTML-тегов
set mps+=":"                " показывать совпадающие скобки для HTML-тегов
syntax on                   " Подсветка синтаксиса
set scrolloff=7				" Скроллить не доходя до конца ко-во строк


" Соранение файлов только для чтения без SUDO
cmap w!! w !sudo tee > /dev/null %

"Если вы используете обычный терминальный Вим, а не NeoVim, то...
"... для изменения курсора в разных режимах используйте это:
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
"Если вы используете обычную qwerty, то поменяте mac на win
set keymap=russian-jcukenwin
"Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
set imsearch=0
"set spell spelllang=ru,en  " Языки проверки орфографии
set nospell                 " По умолчанию - без проверки орфографии
set wildmenu                " при нажатии Tab в командном режиме для авто дополнения варианты будут отображаться в меню, а не появляться по-одному.

" ============= PYTHON ===============
let python_highlight_all=1    "Подсвечивать все в Python
" отображение плохих пробелов
"highlight BadWhitespace ctermbg=red guibg=red
" Помечать конечные пробелы как плохие
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py %s/\s\+$//e
" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" python-mode
let g:pymode_python = 'python3'
let g:pymode_lint_ignore=["E501", "C901"]

"============ Autoindent =============
au BufRead,BufNewFile *.py,*pyw set tabstop=4
au BufRead,BufNewFile *.py,*pyw set softtabstop=4
au BufRead,BufNewFile *.py,*pyw set autoindent
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set textwidth=80
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h set colorcolumn=80
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix
" for full stack development
au BufNewFile,BufRead *.js, *.html, *.css set tabstop=2
au BufNewFile,BufRead *.js, *.html, *.css set shiftwidth=2
au BufNewFile,BufRead *.js, *.html, *.css set softtabstop=2

" ===========================================================================
"                     Настройки внешнего вида  редактора
" ===========================================================================
"set number relativenumber	" Нумерация строк
set number					" Нумерация строк
"set cursorline				" подсвечивать строку с курсором

"colorscheme sublimemonokai  " Цветовая тема
"colorscheme afterglow

" ONE and ONEDARK - Цветовая тема настройки
let g:one_allow_italics = 1 " I love italic for comments
let g:onedark_terminal_italics = 1

" challenger_deep - Цветовая тема настройка
"if (has("termguicolors"))
"	set termguicolors
"endif

" Embark - Цветовая тема настройка
let g:embark_terminal_italics = 1
" Srcery - Цветовая тема настройка

" Цветовая тема
colorscheme srcery
let g:srcery_italic = 1
let g:srcery_bold = 1

" == Строка состояния AirLine ==
set laststatus=2
"let g:airline_theme='afterglow' " Цветовая тема строки состояния status bar
"let g:airline_theme='bubblegum' " Цветовая тема строки состояния status bar
"let g:airline_theme='one' " Цветовая тема строки состояния status bar
let g:airline_powerline_fonts = 1 "Включить поддержку Powerline шрифтов
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1 "Автоматически отображает все буферы
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_skip_empty_sections = 1   " Не рисовать разделители для пустых разделов
let g:airline#extensions#virtualenv#enabled = 1	" Python virtualenv


" ========== NERDTree ==========
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nmap " :NERDTreeToggle<CR>

" ----------------------------------------
" Невидимые символы (пробелы, табуляция)
" ----------------------------------------
" Включение отображения невидимых символов
"set list
" Вид табуляции и пробела
"set lcs=tab:│\ ,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:└─,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:▸·,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:\ \ ,trail:·,extends:>,precedes:<,nbsp:&
"set lcs=tab:·\ ,trail:·,extends:>,precedes:<,nbsp:&

" indentLine
"let g:indentLine_char = '¦'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" ===========================================================================
"                                  Файл 
"   F1 - Для отображения дерева каталога
"   F2 - сохранить
"   F4 - Замена в файле
"   Ctrl + F - поиск в открытом буфере
"   Ctrl + F2 - Сохранить если не хватает прав
"   Ctrl+F10 - выйти
"   Ctrl+z - отмена
"   Ctrl+y - отмена отмены
" ===========================================================================
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

" Ctrl+F10 - выйти
map <C-F10> :q<cr>
imap <C-F10> <Esc>:q<cr>

" Удаление плагинов 
nmap <F8> :PlugClean<cr>
imap <F8> <Esc>:PlugClean<cr>

" Установка плагинов 
nmap <F9> :PlugInstall<cr>
imap <F9> <Esc>:PlugInstall<cr>

" Обновление плагинов
nmap <F10> :PlugUpdate<cr>
imap <F10> <Esc>:PlugUpdate<cr>

" Обновление програмки для установки плагинов
nmap <C-F11> :PlugUpgrade<cr>
imap <C-F11> <Esc>:PlugUpdate<cr>

" Для отображения выбора тем подсветки синтаксиза
nmap <F12> :SwitchColorScheme<cr>
imap <F12> <Esc>:SwitchColorScheme<cr>

" Ctrl+z - отмена
map <C-z> u
imap <C-z> u <Esc><C-r>
" Ctrl+y - отмена отмены
map <C-y> <C-r>
imap <C-y> <Esc><C-r>


" ===========================================================================
"									Разное           
" ===========================================================================
nnoremap ,<space> :nohlsearch <CR>	" снять выделение после поиска слов 

" ===========================================================================
"                                  Окна 
"   * Ctrl + rigth - окно вправо
"   * Ctrl + left - окно влево 
"   * Ctrl + up - окно вверх 
"   * Ctrl + down - окно вниз
" ===========================================================================
" Перемещение по окнам
map <C-right> <C-w>l
map <C-left> <C-w>h
map <C-up> <C-w>k
map <C-down> <C-w>j

imap <C-right> <C-w>l
imap <C-left> <C-w>h
imap <C-up> <C-w>k
imap <C-down> <C-w>j

" ===========================================================================
"                                   Табы
"   * tab - следующий таб
"   * Shift + tab - следующий таб
"   * Alt + up - Новый таб
"   * Alt + down - Закрыть таб
" ===========================================================================
map <tab> :tabn<cr>
map <S-tab> :tabp<cr>
imap <tab> <Esc>:tabn<cr>i
imap <S-tab> <Esc>:tabp<cr>i
map <A-up> :tabnew<cr>
map <A-down> :tabclose<cr>i

" ===========================================================================
"                                  Закомментировать блок 
" ===========================================================================
vmap // :norm i# <CR>
vmap ?? :norm ^2x<CR>

" ===========================================================================
"   Enter вставить пустую строку ниже текущей, Shift+Enter вставить выше
" ===========================================================================
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" ===========================================================================
"                                   Скобки
" ===========================================================================
" Автоматическое закрытие скобок
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
imap < <><LEFT>
