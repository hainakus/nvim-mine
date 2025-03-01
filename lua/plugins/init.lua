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
  "stsewd/spotify.nvim",
  build = ":UpdateRemotePlugins",
  config = function()
    require("spotify").setup()
  end,
  init = function()
    -- Optional mappings.
    vim.keymap.set("n", "<leader>ss", ":Spotify play/pause<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sj", ":Spotify next<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sk", ":Spotify prev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>so", ":Spotify show<CR>", { silent = true })
    vim.keymap.set("n", "<leader>sc", ":Spotify status<CR>", { silent = true })
  end,
}

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
