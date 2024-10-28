-- Move highlighted text blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv-gv")

-- Keep searched terms center screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Quick clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>yy", '"+yy')

-- Find and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Use double arrow to navigate panes
vim.keymap.set("n", "<C-Left>", "<C-w>h", {})
vim.keymap.set("n", "<C-Down>", "<C-w>j", {})
vim.keymap.set("n", "<C-Up>", "<C-w>k", {})
vim.keymap.set("n", "<C-Right>", "<C-w>l", {})
