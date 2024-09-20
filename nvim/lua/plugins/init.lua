return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server",
        "stylua",
  			"html-lsp",
        "css-lsp",
        "typescript-language-server",
        "prettier",
        "solargraph",
        "emmet_language_server",
        "jdtls"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "ruby",
        "java",
        "markdown",
        "markdown_inline"
  		},
      indent = {
        enable = true,
        disable = { "ruby" }
      },
  	},
  },

  {
      "christoomey/vim-tmux-navigator", lazy = false,
      cmd = {
        "TmuxNavigateLeft",
        "TmuxNavigateDown",
        "TmuxNavigateUp",
        "TmuxNavigateRight",
        "TmuxNavigatePrevious",
      },
      keys = {
        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
  },

  {
    "github/copilot.vim", lazy = false,
  },

  {
    'glacambre/firenvim', build = ":call firenvim#install(0)", lazy = false,
  },

  -- icons -- used by render-markdown for code block icons
  require("custom.mini"),

  -- render markdown files
  require("custom.render-markdown"),

  -- timer plugin
  require("custom.pomo"),

  -- obsidian plugin
  require("custom.obsidian"),

}
