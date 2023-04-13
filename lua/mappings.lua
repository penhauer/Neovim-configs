local opts = { noremap = true, silent = true }

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

vim.keymap.set('n', "<LEADER>e", "<CMD>NvimTreeToggle<CR>",
    { noremap = true, silent = true, desc = "Toggle Explorer" })


vim.keymap.set('n', "<LEADER>tf", "<CMD>ToggleTerm direction=float<CR>",
    { noremap = true, silent = true, desc = "toggle Terminal Float" })
vim.keymap.set('n', "<LEADER>th", "<CMD>ToggleTerm size=20 direction=horizontal<CR>",
    { noremap = true, silent = true, desc = "toggle Terminal Horizontally" })
vim.keymap.set('n', "<LEADER>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>",
    { noremap = true, silent = true, desc = "toggle Terminal Vertically" })

vim.keymap.set('n', "<LEADER>tl", "<Cmd>Telescope <CR>",
    { noremap = true, silent = true, desc = "Telescope" })

vim.keymap.set('n', "<LEADER>ff", "<Cmd>Telescope find_files<CR>",
    { noremap = true, silent = true, desc = "Telescope Find Files with" })
