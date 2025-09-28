function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

function vmap(shortcut, command)
  map('v', shortcut, command)
end

function cmap(shortcut, command)
  map('c', shortcut, command)
end

function tmap(shortcut, command)
  map('t', shortcut, command)
end


nmap( "<Tab>", ":bn<CR>")
nmap( "<S-Tab>", ":bp<CR>")
nmap( "<c-h>", "<C-w>h")
nmap( "<c-j>", "<C-w>j")
nmap( "<c-k>", "<C-w>k")
nmap( "<c-l>", "<C-w>l")

nmap( "<leader>o" ,"<cmd>Oil<CR>")
nmap( "<C-p>", ":Telescope find_files<CR>")
nmap( "<C-t>", ":Telescope lsp_dynamic_workspace_symbols<CR>")
nmap( "<leader> ct>", ":Telescope tags<CR>")
nmap( "<leader>fg", ":Telescope live_grep<CR>")
nmap("<leader>bp", ":lua require(\"dap\").toggle_breakpoint()<CR>")
nmap("<leader>dc", ":lua require(\"dap\").continue()<CR>")
nmap("<leader>so", ":lua require(\"dap\").step_over()<CR>")
nmap("<leader>si", ":lua require(\"dap\").step_into()<CR>")
nmap("<Leader>nf", ":lua require('neogen').generate()<CR>", opts)



