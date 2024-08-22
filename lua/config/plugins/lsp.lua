return {

	{
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets"
		},

	},	
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",

		},
		config = function()
			local cmp = require('cmp')

			local luasnip = require("luasnip")
			
			-- load vscode style snip
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
		  		snippet = {
		  		  -- REQUIRED - you must specify a snippet engine
		  		  expand = function(args)
		  		    luasnip.lsp_expand(args.body) -- For `luasnip` users.
		  		  end,
		  		},
		  		window = {
		  		  completion = cmp.config.window.bordered(),
		  		  documentation = cmp.config.window.bordered(),
		  		},
		  		mapping = cmp.mapping.preset.insert({
		  		  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
		  		  ['<C-f>'] = cmp.mapping.scroll_docs(4),
		  		  ['<C-Space>'] = cmp.mapping.complete(),
		  		  ['<C-e>'] = cmp.mapping.abort(),
		  		  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		  		}),
		  		sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = 'luasnip' }, -- For luasnip users.
		  			{ name = 'path' },
				}, {
		  		  { name = 'buffer' },
		  		})
		 	})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require('lspconfig')
			
			-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.cmake.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
		end,
	}
} 
