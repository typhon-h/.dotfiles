return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",

    config = function()
      require("gitsigns").setup()
      local telescope = require("telescope.builtin")

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gb", telescope.git_branches, {})
      vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gc", telescope.git_commits, {})
    end,
  },
}
