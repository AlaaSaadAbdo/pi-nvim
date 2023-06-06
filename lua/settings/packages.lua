local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lsp = {
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-refactor",
}

local misc = {
  "tweekmonster/startuptime.vim", -- benchmark startup
  "mbbill/undotree",
  "lukas-reineke/indent-blankline.nvim",
  "dominikduda/vim_current_word",
  "ethanholz/nvim-lastplace",
  "tpope/vim-unimpaired",
  "AndrewRadev/splitjoin.vim",
  "antoinemadec/FixCursorHold.nvim",
}

local text = {
  "scrooloose/nerdcommenter",
  "AndrewRadev/tagalong.vim",
  "machakann/vim-sandwich",
  "alvan/vim-closetag",
  "andymass/vim-matchup",
  "leafOfTree/vim-matchtag",
  "windwp/nvim-autopairs",
  "mhartington/formatter.nvim",
}

local fzf = {
  { "junegunn/fzf", build = "./install --all" }, -- Fuzzy Searcher
  "junegunn/fzf.vim",
}

local themes = {
  "sainnhe/gruvbox-material",
}

local ui = {
  "kyazdani42/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
}

local completion = {
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "rafamadriz/friendly-snippets",
}

local lazy = require("lazy")
lazy.setup({
  -- init,
  lsp,
  misc,
  fzf,
  completion,
  themes,
  ui,
  text,
})
