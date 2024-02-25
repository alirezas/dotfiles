return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					-- Add any other default options here
					file_ignore_patterns = { "node_modules", ".git", ".cache" },
					live_grep = {
						hidden = true,
					},
				},
				pickers = {
					file_browser = {
						hidden = true,
					},
					find_files = {
						hidden = true,
					},
					live_grep = {
						additional_args = function(opts)
							return { "--hidden" }
						end,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

			require("telescope").load_extension("ui-select")
		end,
	},
}
