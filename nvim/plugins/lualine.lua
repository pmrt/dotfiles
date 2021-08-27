if vim.api.nvim_get_option("statusline") == "" then
	require('lualine').setup{
		options = {
			icons_enabled = 1,
			theme = "horizon"
		}
	}
end
