return {
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				auto_scroll = true,
				open_mapping = [[<c-\>]],
				start_in_insert = true,
  				insert_mappings = true, -- whether or not the open mapping applies in insert mode
  				terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  				persist_size = true,
			})
		end,
	}
}
