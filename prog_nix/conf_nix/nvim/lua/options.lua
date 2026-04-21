require "nvchad.options"


-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.o

-- Кольори
o.termguicolors = true -- Повна підтримка кольорів (true color)

-- Файли та буфери
o.swapfile = false -- Без swap-файлів
o.backup = false   -- Без backup-файлів
o.undofile = true  -- Постійна історія undo

-- Прокрутка
o.scrolloff = 8     -- Завжди видно 8 рядків навколо курсора
o.sidescrolloff = 8 -- Те ж саме по горизонталі

-- Нумерація
o.number = true         -- Абсолютний номер рядка
o.relativenumber = true -- Відносні номери

-- Миша
o.mouse = "a" -- Увімкнути мишу

-- Пошук
o.ignorecase = true -- Ігнорувати регістр
o.smartcase = true  -- Якщо є великі літери — враховує
o.hlsearch = false  -- Не підсвічувати всі результати
o.incsearch = true  -- Пошук "на льоту"

-- Відображення
o.wrap = false           -- Краще вимкнути (зручніше для коду)
o.colorcolumn = "80,100" -- Ліміти ширини
o.signcolumn = "yes"     -- Завжди показувати колонку знаків (LSP, git)

-- Табуляція
o.tabstop = 4        -- Таб = 4 пробіли
o.shiftwidth = 4     -- Відступ = 4
o.softtabstop = 4
o.expandtab = true   -- Таб → пробіли
o.smartindent = true -- Розумні відступи

-- Буфер обміну
o.clipboard = "unnamedplus" -- Системний буфер

-- Інтерфейс
o.cursorline = true -- Підсвітка поточного рядка
o.termguicolors = true
o.splitright = true -- Вертикальні спліти справа
o.splitbelow = true -- Горизонтальні знизу

-- Швидкість
o.updatetime = 250 -- Швидше оновлення (для LSP, git signs)
o.timeoutlen = 400 -- Менша затримка для комбінацій

-- Кодування
o.encoding = "utf-8"
o.fileencoding = "utf-8"

-- Мапінг розкладки (укр/рос → англ)
o.langmap =
"ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"
