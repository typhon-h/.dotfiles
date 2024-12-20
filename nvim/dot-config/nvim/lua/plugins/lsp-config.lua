return {
	{
		"williamboman/mason.nvim",
		opts = {
			registries = {
				"github:nvim-java/mason-registry",
				"github:mason-org/mason-registry",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("java").setup({
        jdk = {
          auto_install = false,
        },
      })
			require("mason-lspconfig").setup_handlers({
				function(server_name) -- default handler (optional)
					-- generic configs
					local config = {
						capabilities = capabilities,
					}

					if server_name == "jdtls" then
						config.settings = {
							java = {
								configuration = {
									runtimes = {
										{
											name = "SystemJava",
											path = "/usr/bin/java",
											default = true,
										},
									},
								},
							},
						}
					end

					require("lspconfig")[server_name].setup(config)
				end,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			local telescope = require("telescope.builtin")
			vim.keymap.set("n", "<leader>gd", telescope.lsp_definitions, {})
			vim.keymap.set("n", "<leader>gi", telescope.lsp_implementations, {})
			vim.keymap.set("n", "<leader>gr", telescope.lsp_references, {})
			vim.keymap.set("n", "<leader>d", function()
				telescope.diagnostics({ bufnr = 0 })
			end)
			vim.keymap.set("n", "<leader>dw", telescope.diagnostics, {})

			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

			local diagnostics_active = true
			vim.keymap.set("n", "<leader>dh", function()
				diagnostics_active = not diagnostics_active

				vim.diagnostic.config({ virtual_text = diagnostics_active })
			end)
		end,
	},
}
