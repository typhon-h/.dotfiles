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
					"jdtls",
					"tsserver",
					"kotlin_language_server",
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
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.html.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.pyright.setup({})
			lspconfig.omnisharp.setup({})
			lspconfig.volar.setup({})

			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, {})
			vim.keymap.set("n", "<leader>gr", telescope.lsp_references, {})
      vim.keymap.set("n", "<leader>d", telescope.diagnostics, {})
		end,
	},
}
