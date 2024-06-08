return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local tree = require("neo-tree")

    tree.setup({
      filesystem = {
        group_empty_dirs = true,
        scan_mode = "deep",
      },
    })

    vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal float<CR>", {})
  end,
}
