return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
      vim.notify("Current buffer added to Harpoon", vim.log.levels.INFO)
    end)

    vim.keymap.set("n", "<leader>r", function()
      harpoon:list():clear()
      vim.notify("Harpoon reset", vim.log.levels.INFO)
    end)

    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<C-h>", function()
      harpoon:list():select(1)
    end)

    vim.keymap.set("n", "<C-t>", function()
      harpoon:list():select(2)
    end)

    vim.keymap.set("n", "<C-n>", function()
      harpoon:list():select(3)
    end)

    vim.keymap.set("n", "<C-s>", function()
      harpoon:list():select(4)
    end)
  end,
}
