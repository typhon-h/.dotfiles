return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "RchrdAriza/nvim-web-devicons", "MaximilianLloyd/ascii.nvim" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			local ascii = require("ascii")

			local time = os.date("%H:%M")
			local date = os.date("%a %d %b")
			local v = vim.version()
			local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch
			dashboard.section.buttons.val = {
				dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "󰮗   Find file", ":cd $HOME | Telescope find_files<CR>"),
				dashboard.button("e", "   File Explorer", ":cd $HOME | Neotree reveal float<CR>"),
				dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("c", "   Configuration", ":e ~/.config/nvim/lua/vim-options.lua<CR>"),
				dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
				dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
			}

			local function centerText(text, width)
				local totalPadding = width - #text
				local leftPadding = math.floor(totalPadding / 2)
				local rightPadding = totalPadding - leftPadding
				return string.rep(" ", leftPadding) .. text .. string.rep(" ", rightPadding)
			end

 		dashboard.section.footer.val = {
 			centerText("Kaizoku Ou Ni Ore Wa Naru", 50),
 			" ",
 			centerText(date, 50),
 			centerText(time, 50),
 			centerText(version, 50),
 		}

			dashboard.section.header.val = ascii.get_random("text", "neovim") 

			-- Send config to alpha
			alpha.setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
		end,
	},
}
