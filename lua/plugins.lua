vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup()
		end
	},
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf",
		lazy = false,
		priority = 10000,
		config = function()
			require('neoconf').setup()
		end
	},
	"folke/neodev.nvim",
	--'preservim/nerdtree',
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup {}
		end,
	},
	{
		"danymat/neogen",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			require('gitsigns').setup()
		end
	},
	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		--dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
		config = function()
			require('plugin_setups/lualine')
		end,
	},
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	{
		'embark-theme/vim',
		lazy = false,
		config = function()
			vim.cmd([[colorscheme embark]])
		end,
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			require('plugin_setups/lspconfig')
		end
	},
	'onsails/lspkind.nvim',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'simrat39/rust-tools.nvim',
	'ap/vim-css-color',
	'tpope/vim-surround',
	'mattn/emmet-vim',
	'tpope/vim-fugitive',
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('plugin_setups/treesitter')
		end,
	},
	'nvim-treesitter/nvim-treesitter-context',
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' } }
	},
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end
	},
	'https://git.sr.ht/~lmartinez/lualine-embark',
	{
		'stevearc/aerial.nvim',
		config = function()
			require('aerial').setup({
				backends = { "lsp", "treesitter", "markdown" },
				on_attach = function(bufnr)
					-- Toggle the aerial window with <leader>a
					vim.api.nvim_buf_set_keymap(bufnr, "n", "<c-,>", "<cmd>AerialToggle! left<CR>", {})
					-- Jump forwards/backwards with "{" and "}"
					vim.api.nvim_buf_set_keymap(bufnr, "n", "{", "<cmd>AerialPrev<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "}", "<cmd>AerialNext<CR>", {})
					-- Jump up the tree with "[[" or "]]"
					vim.api.nvim_buf_set_keymap(bufnr, "n", "[[", "<cmd>AerialPrevUp<CR>", {})
					vim.api.nvim_buf_set_keymap(bufnr, "n", "]]", "<cmd>AerialNextUp<CR>", {})
				end,
				layout = {
					default_direction = "prefer_left",
					max_width = { 40, 0.2 },
					width = nil,
					min_width = 20,
				}
			})
		end
	},
	'stevearc/dressing.nvim',
	{
		{
			"kawre/leetcode.nvim",
			build = ":TSUpdate html",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim", -- required by telescope
				"MunifTanjim/nui.nvim",

				-- optional
				"rcarriga/nvim-notify",
			},
			opts = {
				-- configuration goes here
				---@type lc.domain
				domain = "com", -- For now "com" is the only one supported

				---@type string
				arg = "leetcode.nvim",
				---@type lc.lang
				lang = "python",

				---@type lc.sql
				sql = "mysql",

				---@type string
				directory = vim.fn.stdpath("data") .. "/leetcode/",

				---@type boolean
				logging = true,

				console = {
					---@type boolean
					open_on_runcode = true,

					size = {
						width = "75%", ---@type string | integer
						height = "75%", ---@type string | integer
					},
					dir = "row", ---@type "col" | "row"
				},

				description = {
					width = "40%", ---@type string | integer
				},
			},
		}
	},

	{
		'mfussenegger/nvim-dap',
		config = function()
			require('plugin_setups/dap')
		end
	},
	'rcarriga/nvim-dap-ui',
	'mfussenegger/nvim-dap-python',
	'nvim-neotest/nvim-nio',
	{
		'RaafatTurki/corn.nvim',
		config = function()
			vim.diagnostic.config { virtual_text = false }
			local corn_scope = "line"
			local toggle_corn_scope = function()
				if corn_scope == "line" then
					corn_scope = "file"
				else
					corn_scope = "line"
				end
				require('corn').scope(corn_scope)
			end
			require('corn').setup({
				on_toggle = function(is_hidden)
					vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
				end
			})
		end
	},
	{
		'habamax/vim-godot',
	},
	{
		'donRaphaco/neotex',
		ft = 'tex',
	}

})
