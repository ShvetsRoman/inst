require("full-border"):setup({
	-- Available values: ui.Border.PLAIN,ui.Border.ROUNDED
	-- type = ui.Border.ROUNDED,
})

-------------------------------------------------------------------------------
-- 1. HEADER LINE: githead.yazi (Верхня панель у стилі Nord + Git)
-------------------------------------------------------------------------------
require("githead"):setup({
    -- Основний акцент для поточного шляху / активної папки (Nord8 - Frost)
    color = "#88c0d0",

    -- Другорядний темний фон для решти інформації (Nord3 - Polar Night)
    secondary_color = "#3b4252",

    -- Стиль стрілочок ("angly" створює Powerline-кути)
    separator_style = "liney",
    -- separator_style = "angly",

    -- Гліфи розділювачів (мають збігатися з нижньою панеллю)
    -- separator_open       = "",
    -- separator_close      = "",
    -- separator_open_thin  = "",
    -- separator_close_thin = "",

    -- Спеціальні кастомні іконки статусів Git (Nord-палітра)
    -- Якщо статус спокійний - Nord14 (Зелений),якщо є зміни - Nord13 (Жовтий)
    git_symbols = {
        clean     = "✔",
        staged    = "●",
        modified  = "✚",
        untracked = "…",
        ignored   = "☒",
        conflict  = "✖",
    }
})

-------------------------------------------------------------------------------
-- 2. STATUS LINE: yaziline.yazi (Нижня панель у стилі Nord)
-------------------------------------------------------------------------------
require("yaziline"):setup({
    -- Колір режиму за замовчуванням (Nord8 - Frost / Блакитний)
    color = "#88c0d0",

    -- Контрастний фон для інформаційних блоків (Nord3)
    secondary_color = "#3b4252",

    -- Колір лічильника файлів,коли таб неактивний (Nord4 - Snow Storm)
    default_files_color = "#d8dee9",

    -- Колір для виділених файлів (Nord14 - Aurora Green / Зелений)
    selected_files_color = "#a3be8c",

    -- Колір для скопійованих файлів (Nord13 - Aurora Yellow / Жовтий)
    yanked_files_color = "#ebcb8b",

    -- Колір для вирізаних файлів (Nord11 - Aurora Red / Червоний)
    cut_files_color = "#bf616a",

    -- Символ виділення
    select_symbol = "",

    -- Стиль розділювачів
    separator_style = "liney",
    -- separator_style = "angly",

    -- Powerline гліфи для побудови статус-бару
    -- separator_open       = "",
    -- separator_close      = "",
    -- separator_open_thin  = "",
    -- separator_close_thin = "",
    -- separator_head       = "",
    -- separator_tail       = "",

    show_background = true,
    filename_truncate_len = 25,
})
