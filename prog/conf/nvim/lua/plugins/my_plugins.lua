local plugins = {

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lua stuff
        "lua-language-server",
        "stylua",

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
      },
    },
  },



}

return plugins
