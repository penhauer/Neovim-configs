local opts = { noremap=true, silent=true }

-- window resizing
-- only works with alacritty and no tmux
vim.keymap.set('n', "<C-S-h>", ":1 wincmd < <CR>", opts)
vim.keymap.set('n', "<C-S-l>", ":1 wincmd > <CR>", opts)
vim.keymap.set('n', "<C-S-k>", ":1 wincmd - <CR>", opts)
vim.keymap.set('n', "<C-S-j>", ":1 wincmd + <CR>", opts)


function is_available(plugin)
  require("util.init").is_available(plugin)
  return true
end

-- NeoTree
-- todo: refactor this
opts.desc = "Toggle Explorer"
vim.keymap.set('n', "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
opts.desc = nil



vim.opt.tabstop = 2


vim.opt.expandtab = true

vim.opt.shiftwidth = 2

vim.opt.number = true

vim.opt.relativenumber = true

vim.cmd("colorscheme catppuccin-frappe")


vim.keymap.set('n', "<Space>t", ":ToggleTerm<CR>", opts)

vim.opt.equalalways = false


-- clearjumps
-- not working! debug later
vim.cmd("clearjumps")


vim.keymap.set('n', "<Leader>f", "<Cmd>Telescope find_files <CR>", opts)


vim.opt.scrolloff = 4
