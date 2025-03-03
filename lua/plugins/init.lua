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
    model = "qwen2.5-coder",
    model_code = "qwen2.5-coder",
    url = "http://192.168.1.190:11434",
    serve = {
      on_start = false,
      command = "ollama",
      args = { "serve" },
      stop_command = "pkill",
      stop_args = { "-SIGTERM", "ollama" },
    },
  }
},
  {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        -- add --login so ~/.zprofile is loaded
        -- https://vi.stackexchange.com/questions/16019/neovim-terminal-not-reading-bash-profile/16021#16021
        shell = "zsh --login",
      })
    end,
    keys = {
      { [[<C-\>]] },
      { "<leader>0", "<Cmd>2ToggleTerm<Cr>", desc = "Terminal #2" },
      {
        "<leader>td",
        "<cmd>ToggleTerm size=40 dir=~/Desktop direction=horizontal<cr>",
        desc = "Open a horizontal terminal at the Desktop directory",
      },
    },
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
{
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
},
-- lazydocker.nvim
{
  "mgierada/lazydocker.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  config = function()
    require("lazydocker").setup({
	    border = "curved", -- valid options are "single" | "double" | "shadow" | "curved"
    })
  end,
  event = "VeryLazy",
  keys = {
    {
      "<leader>ld",
      function()
        require("lazydocker").open()
      end,
      desc = "Open Lazydocker floating window",
    },
  },
},
}
