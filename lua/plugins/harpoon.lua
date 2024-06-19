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

    vim.keymap.set("n", "<leader>h", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    for i = 1, 4 do
      vim.keymap.set("n", "<C-" .. i .. ">", function()
        harpoon:list():select(i)
      end)
    end
  end,
}
