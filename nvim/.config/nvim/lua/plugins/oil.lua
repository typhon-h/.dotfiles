return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      keymaps = {
        ["<C-t>"] = false,
      },
      view_options = {
        show_hidden = true,
      },
      -- Open parent directory in current window vim.
      vim.keymap.set("n", "-", ":Oil<CR>", { desc = "Open parent directory" }),
      -- Open parent directory in floating window
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float),
    })
  end,
}
