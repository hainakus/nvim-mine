return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
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
  'cockytrumpet/yt_audio.nvim',
  init = function()
    vim.api.nvim_set_keymap('n', '<leader>yp', ':YAPlay<CR>', { noremap = true, silent = true }) -- prompt for url
    vim.api.nvim_set_keymap('n', '<leader>y1', ':YAPlay https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUJcmljayByb2xs<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ys', ':YAStop<CR>', { noremap = true, silent = true })
  end,
  event = 'VeryLazy',
  opts = true,
},
 {
  "gerazov/ollama-chat.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- lazy load on command
  cmd = {
    "OllamaQuickChat",
    "OllamaCreateNewChat",
    "OllamaContinueChat",
    "OllamaChat",
    "OllamaChatCode",
    "OllamaModel",
    "OllamaServe",
    "OllamaServeStop"
  },

  keys = {
    {
      "<leader>ocq",
      "<cmd>OllamaQuickChat<cr>",
      desc = "Ollama Quick Chat",
      mode = { "n", "x" },
      silent = true,
    },
    {
      "<leader>ocn",
      "<cmd>OllamaCreateNewChat<cr>",
      desc = "Create Ollama Chat",
      mode = { "n", "x" },
      silent = true,
    },
    {
      "<leader>occ",
      "<cmd>OllamaContinueChat<cr>",
      desc = "Continue Ollama Chat",
      mode = { "n", "x" },
      silent = true,
    },
    {
      "<leader>och",
      "<cmd>OllamaChat<cr>",
      desc = "Chat",
      mode = { "n" },
      silent = true,
    },
    {
      "<leader>ocd",
      "<cmd>OllamaChatCode<cr>",
      desc = "Chat Code",
      mode = { "n" },
      silent = true,
    },
  },

  opts = {
    chats_folder = vim.fn.stdpath("data"), -- data folder is ~/.local/share/nvim
    -- you can also choose "current" and "tmp"
    quick_chat_file = "ollama-chat.md",
    animate_spinner = true,  -- set this to false to disable spinner animation
    model = "openhermes2-mistral",
    model_code = "codellama",
    url = "http://127.0.0.1:11434",
    serve = {
      on_start = false,
      command = "ollama",
      args = { "serve" },
      stop_command = "pkill",
      stop_args = { "-SIGTERM", "ollama" },
    },
  }
},
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
