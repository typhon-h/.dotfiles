-- Move highlighted text blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv-gv")

-- Keep searched terms center screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Quick clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")

-- Find and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Use Shift-Direction to navigate panes
vim.keymap.set("n", "H", "<C-w>h", {})
vim.keymap.set("n", "J", "<C-w>j", {})
vim.keymap.set("n", "K", "<C-w>k", {})
vim.keymap.set("n", "L", "<C-w>l", {})
