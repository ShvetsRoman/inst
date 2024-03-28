local plugins = {

  -- Портативний менеджер пакетів.Легко встановлюйте та керуйте серверами LSP, серверами DAP, лінтерами та форматувальниками.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylelint-lsp",

        -- python
        "pyright",
        "python-lsp-server",

        -- web dev
        "css-lsp",
        "html-lsp",
        "typescript-language-server",
        "deno",
        "prettier",
        "emmet-ls",
        "json-lsp",

        -- shell
        "shfmt",
        "shellcheck",
        "bash-language-server",
      },
    },
  },

-- повністю замінює інтерфейс користувача для повідомлень, командний рядок і спливаюче меню.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- додайте тут будь-які параметри
    },
    config = function ()
      require("configs.noice")
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      }
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies ={
      {
        "hrsh7th/cmp-cmdline",
          config = function ()
            require("configs.cmdline")
          end,
      },
    },
  },

}

return plugins
