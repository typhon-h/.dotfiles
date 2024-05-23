return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"html",
					"tsserver",
					"pyright",
					"omnisharp",
					"volar",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, {})
			vim.keymap.set("n", "<leader>gr", telescope.lsp_references, {})
			vim.keymap.set("n", "<leader>d", telescope.diagnostics, {})
		end,
	},
}
