return {
  "rcarriga/nvim-notify",

  config = function()
    local notify = require("notify")
    vim.notify = notify

    vim.keymap.set("n", "<leader>n", function()
      notify.dismiss({ silent = true, pending = true })
    end)
  end,
}
