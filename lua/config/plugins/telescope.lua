return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-live-grep-args.nvim'
	},
    config = function ()
    	local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
		vim.keymap.set("n", "<leader>ft", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

		require("telescope").load_extension("live_grep_args")
    end,
}
