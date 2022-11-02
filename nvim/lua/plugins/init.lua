local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim/plugin/packer.lua'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.cmd('packadd packer.nvim')
end

require('packer').startup({
	config = {
		compile_path = compile_path,
	},
	function(use)
		use('wbthomason/packer.nvim')
		use('tpope/vim-surround')

		use("savq/melange")

		use({
			'hoob3rt/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true },
			config = function()
				require('plugins.line')
			end,
		})

		use({
			'kyazdani42/nvim-web-devicons',
			config = function()
				require('plugins.devicons')
			end,
		})

		use({
			'lukas-reineke/indent-blankline.nvim',
			config = function()
				require('plugins.indentline')
			end,
		})

		use({
			'windwp/nvim-autopairs',
			config = function()
				require('plugins.autopairs')
			end,
		})

		use({
			'nvim-telescope/telescope.nvim',
			requires = {
				'nvim-lua/plenary.nvim',
				'nvim-telescope/telescope-github.nvim',
				'nvim-telescope/telescope-packer.nvim',
			},
			config = function()
				require('plugins.telescope')
			end,
		})


		use({
			'lewis6991/gitsigns.nvim',
			requires = { 'nvim-lua/plenary.nvim' },
			config = function()
				require('plugins.gitsigns')
			end,
		})

		use({
			'goolord/alpha-nvim',
			requires = { 'kyazdani42/nvim-web-devicons' },
			config = function()
				require 'alpha'.setup(require 'alpha.themes.startify'.config)
			end
		})

		use({
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate',
			requires = {
				'nvim-treesitter/nvim-treesitter-textobjects',
			},
			config = function()
				require('plugins.treesitter')
			end,
		})

		use {
			'm-demare/hlargs.nvim',
			requires = { 'nvim-treesitter/nvim-treesitter' },
			config = function()
				require('plugins.hlargs')
			end
		}

		use({
			'hrsh7th/nvim-cmp',
			requires = {
				'hrsh7th/cmp-vsnip',
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/vim-vsnip',
				'hrsh7th/vim-vsnip-integ',
				'hrsh7th/cmp-buffer',
				'onsails/lspkind-nvim',
			},
			config = function()
				require('plugins.cmp')
			end,
		})

		use({
			'junnplus/nvim-lsp-setup',
			requires = {
				'neovim/nvim-lspconfig',
				'williamboman/mason.nvim',
				'williamboman/mason-lspconfig.nvim',
				'hrsh7th/cmp-nvim-lsp',
				'folke/lsp-colors.nvim',
				'folke/lua-dev.nvim',
				'p00f/clangd_extensions.nvim',
			},
			config = function()
				require('plugins.lsp')
			end,
		})

		use({
			'ojroques/nvim-osc52',
			config = function()
				require('plugins.osc52')
			end
		})

		use('whiteinge/diffconflicts')
		use('mg979/vim-visual-multi')
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("trouble").setup {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				}
			end
		})
	end,
})

local packer_group = vim.api.nvim_create_augroup('packer_group', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	pattern = '*/lua/*.lua',
	callback = function()
		vim.cmd('source <afile>')
		vim.cmd('PackerCompile')
	end,
	group = packer_group,
})
