return {
	-- TODO: Mason removed from lsp due to issues configuring nvim-java DAP
	-- Now mason is added through nvim-java dependencies
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, {})
			vim.keymap.set("n", "<leader>gr", telescope.lsp_references, {})
			vim.keymap.set("n", "<leader>d", telescope.diagnostics, {})
		end,
	},
}
