local vim = vim

vim.opt.number = true

vim.opt.tabstop = 5
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.ignorecase = true 
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
}

local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug 'https://github.com/HoNamDuong/hybrid.nvim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'

vim.call('plug#end')

vim.cmd.colorscheme("hybrid")
vim.lsp.enable('lua_ls')vim.lsp.enable('lua_ls')

vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*/moonloader/*.lua",
  callback = function()
    vim.schedule(function()
      if vim.bo.fileencoding ~= "cp1251" then
        vim.bo.fileencoding = "cp1251"
        vim.cmd("e! ++enc=cp1251")
      end
    end)
  end,
})

vim.keymap.set('n', '<C-t>', ':NERDTreeToggle<CR>', {silent = true})
vim.keymap.set('n', '<C-n>', ':NERDTree<CR>', {silent = true})

