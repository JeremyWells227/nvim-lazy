require('mason').setup()
require('mason-lspconfig').setup()
require('completion_setup')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<space>f', function()
		vim.lsp.buf.format({})
	end, bufopts)
	-- Toggle the aerial window with <leader>a
	--require('aerial').on_attach(client,bufnr)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}
vim.lsp.config['pyright'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}
vim.lsp.config['ts_ls'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,

}
vim.lsp.config['cssls'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}
vim.lsp.config["tailwindcss"] = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}
vim.lsp.config['lua_ls'] = ({
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
}
)
vim.lsp.config['marksman'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}
local rt = require('rust-tools')
local rust_on_attach = function(client,bufnr)
	on_attach(client,bufnr)
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	vim.keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, bufopts)
	vim.keymap.set("n", "<leader>hg", rt.code_action_group.code_action_group, bufopts)
end
rt = {
	tools={
		hover_actions= {
			auto_focus=true,
		},
	},
	server = {
			on_attach = rust_on_attach,
			capabilities=capabilities,
			lsp_flags=lsp_flags,
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					cargo = {
						buildScripts = {
							enable = true,
						},
					},
					procMacro = {
						enable = true
					},
				}
			}
	}
}
--vim.lsp.config['rust_analyzer'] = {
--	on_attach = rust_on_attach,
--	capabilities = capabilities,
--	flags = lsp_flags,
--	-- Server-specific settings...
--	settings = {
--		["rust-analyzer"] = {
--			imports = {
--				granularity = {
--					group = "module",
--				},
--				prefix = "self",
--			},
--			cargo = {
--				buildScripts = {
--					enable = true,
--				},
--			},
--			procMacro = {
--				enable = true
--			},
--		}
--	}
--}
vim.lsp.config['gdscript'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = lsp_flags,
}
