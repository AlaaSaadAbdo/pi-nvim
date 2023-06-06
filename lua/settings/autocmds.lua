local cmd = vim.cmd
local exec = vim.api.nvim_exec
local function autocmd(event, triggers, operations)
  local fncmd = string.format("autocmd %s %s %s", event, triggers, operations)
  vim.cmd(fncmd)
end

cmd("au BufEnter *.txt lua require('settings.utils').help_tab()")

autocmd("CursorHold", "<buffer>", "lua require'lspsaga.diagnostic'.show_line_diagnostics()")

vim.cmd([[
augroup vimrc-incsearch-highlight 
  autocmd! 
  autocmd CmdlineEnter /,\? :set hlsearch 
  autocmd CmdlineLeave /,\? :set nohlsearch 
augroup END
]])

exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.rs,*.lua,*.ts,*.tsx,*.js,*.jsx,*.css,*.scss,*.html,*.json FormatWrite
augroup END
]],
  true
)

cmd("autocmd FileType NvimTree :let b:vim_current_word_disabled_in_this_buffer = 1")

cmd("autocmd BufNewFile,BufRead * setlocal formatoptions-=1jql")
cmd("autocmd VimResized * wincmd =")
