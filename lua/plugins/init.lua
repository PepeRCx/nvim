return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<C-j>",
            next = "<C-]>",
            prev = "<C-p>",
            dismiss = "<C-e>",
          },
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vtsls",
        "biome",
        -- go
        "gopls",
        "gofumpt",
        "goimports",
        -- python
        "pyright",
        "ruff",
        "xmlformatter",
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        xml = { "xmlformatter" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "configs.nvimtree"

      conf.renderer = conf.renderer or {}
      conf.renderer.icons = conf.renderer.icons or {}
      conf.renderer.icons.show = conf.renderer.icons.show or {}

      conf.renderer.icons.show.file = false
      conf.renderer.icons.show.folder = false

      conf.renderer.indent_markers = conf.renderer.indent_markers or {}
      conf.renderer.indent_markers.enable = true

      return conf
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
