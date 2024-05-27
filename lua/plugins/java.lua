return {
    "typhon-h/nvim-java",
    dependencies = {
        "nvim-java/lua-async-await",
        "nvim-java/nvim-java-refactor",
        "nvim-java/nvim-java-core",
        "nvim-java/nvim-java-test",
        "nvim-java/nvim-java-dap",
        "MunifTanjim/nui.nvim",
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
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
            opts = {
                handlers = {
                    ["jdtls"] = function()
                        require("java").setup()
                    end,
                },
            },
        },
    },
    opts = {},
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        lspconfig.jdtls.setup({ capabilities = capabilities })
    end,
}
