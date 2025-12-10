vim.g.mapleader = '\\'

local bindings_per_mode = {
  ['n'] = {
    -- general config
    { keys = '<leader>r',         command = ':lua ReloadConfig()<CR>' },
    { keys = '<leader>T',         command = ':terminal<CR>' },
    { keys = '<F3>',              command = ':noh<CR>' },

    -- saving
    { keys = '<leader>ww',        command = ':w<CR>' },
    { keys = '<leader>wa',        command = ':wa<CR>' },
    { keys = '<leader>Ww',        command = ':w!<CR>' },
    { keys = '<leader>Wa',        command = ':wa!<CR>' },
    { keys = '<leader>wq',        command = ':wq<CR>' },
    { keys = '<leader>Wq',        command = ':wq!<CR>' },

    -- quiting
    { keys = '<leader>qq',        command = ':q<CR>' },
    { keys = '<leader>qa',        command = ':qa<CR>' },
    { keys = '<leader>qd',        command = ':bd<CR>' },
    { keys = '<leader>qt',        command = ':tabclose<CR>' },
    { keys = '<leader>Qq',        command = ':q!<CR>' },
    { keys = '<leader>Qa',        command = ':qa!<CR>' },
    { keys = '<leader>Qd',        command = ':bd!<CR>' },

    -- tree
    { keys = '<leader>tt',        command = ':NvimTreeToggle<CR>' },
    { keys = '<leader>tf',        command = ':NvimTreeFindFile!<CR>' },
    { keys = '<Tab>',             command = ':NvimTreeFocus<CR>' },

    -- files/search
    { keys = '<leader>ff',        command = ':FzfLua files<CR>' },
    { keys = '<leader>fh',        command = ':FzfLua command_history<CR>' },
    { keys = '<leader>fg',        command = ':FzfLua live_grep<CR>' },
    { keys = '<leader>fs',        command = ':FzfLua live_grep<CR>' },
    { keys = '<leader>fw',        command = ':FzfLua grep_cword<CR>' },
    { keys = '<leader>fb',        command = ':FzfLua buffers<CR>' },
    { keys = '<leader>fd',        command = ':FzfLua diagnostics_workspace<CR>' },

    -- commands
    { keys = '<leader>cc',        command = ':FzfLua commands<CR>' },
    { keys = '<leader>ch',        command = ':FzfLua command_history<CR>' },
    { keys = '<leader>cm',        command = ':FzfLua manpages<CR>' },

    -- buffers (plain vim)
    { keys = '<leader>vv',        command = ':split<CR>' },
    { keys = '<leader>hh',        command = ':vsplit<CR>' },
    { keys = '<leader>#',         command = ':#wincmd w<CR>' },
    { keys = '<leader><leader>#', command = '#gt<CR>' },
    { keys = '<leader><leader>o', command = ':tab split<CR>' },

    -- code (LSP + treesitter)
    { keys = '<leader>Cp',        command = ':FzfLua treesitter<CR>' },
    { keys = '<leader>Cf',        command = ':FzfLua lsp_references<CR>' },
    { keys = '<leader>CD',        command = ':FzfLua diagnostics_workspace<CR>' },
    { keys = '<leader>Cd',        command = ':FzfLua lsp_definitions<CR>' },
    { keys = '<leader>Ci',        command = ':FzfLua lsp_implementations<CR>' },
    { keys = '<leader>Ct',        command = ':FzfLua lsp_typedefs<CR>' },
    { keys = '<leader>Cs',        command = ':FzfLua lsp_document_symbols<CR>' },
    { keys = '<leader>CS',        command = ':FzfLua lsp_workspace_symbols<CR>' },
    { keys = '<leader>CI',        command = ':FzfLua lsp_incoming_calls<CR>' },
    { keys = '<leader>CO',        command = ':FzfLua lsp_outgoing_calls<CR>' },

    -- git
    { keys = '<leader>gl',        command = ':FzfLua git_commits<CR>' },
    { keys = '<leader>gs',        command = ':FzfLua git_status<CR>' },
    { keys = '<leader>gb',        command = ':FzfLua git_branches<CR>' },
    { keys = '<leader>gf',        command = ':FzfLua git_bcommits<CR>' },
    { keys = '<leader>ga',        command = ':!git add -f %<CR>' },
    { keys = '<leader>gu',        command = ':!git unstage %<CR>' },

    -- multiple cursors
    { keys = '<A-S-Down>',        command = ':MultipleCursorsAddDown<CR>' },
    { keys = '<A-S-Up>',          command = ':MultipleCursorsAddUp<CR>' },
    { keys = '<C-LeftMouse>',     command = ':MultipleCursorsMouseAddDelete<CR>' },
    { keys = '<C-D>',             command = ':MultipleCursorsAddJumpNextMatch<CR>' },
    { keys = '<C-S-D>',           command = ':MultipleCursorsAddJumpPrevMatch<CR>' },

    -- defaults
    { keys = '<C-i>',             command = '<C-i>' },

    -- move current line
    { keys = '<A-j>',             command = ":m .+1<CR>==" },
    { keys = '<A-Down>',          command = ":m .+1<CR>==" },
    { keys = '<A-k>',             command = ":m .-2<CR>==" },
    { keys = '<A-Up>',            command = ":m .-2<CR>==" },

    -- specs runner
    { keys = '<leader>ss',        command = ':RunSpecs<CR>' },
    { keys = '<leader>sc',        command = ':RunCurrentSpec<CR>' },
    { keys = '<leader>sl',        command = ':RunLastSpecCommand<CR>' },
    { keys = '<leader>sd',        command = ':DisplayLastSpecCommandOutput<CR>' },
    { keys = '<leader>sff',       command = ':RunFailedSpecs<CR>' },
    { keys = '<leader>sfa',       command = ':RunFailedSpecsTillFirstFailure<CR>' },
    { keys = '<leader>sa',        command = ':RunSpecsTillFirstFailure<CR>' },

    -- zen
    { keys = '<leader>zz',        command = ':NoNeckPain<CR>' },
    { keys = '<leader>za',        command = ':NoNeckPainToggleLeftSide<CR>' },
    { keys = '<leader>zd',        command = ':NoNeckPainToggleRightSide<CR>' },
    { keys = '<leader>zw',        command = ':NoNeckPainWidthUp<CR>' },
    { keys = '<leader>zs',        command = ':NoNeckPainWidthDown<CR>' },
  },

  ['v'] = {
    -- indentation
    { keys = '>',          command = '>gv' },
    { keys = '<Tab>',      command = '>gv' },
    { keys = '<',          command = '<gv' },
    { keys = '<S-Tab>',    command = '<gv' },

    -- telescope
    { keys = '<leader>fw', command = [["zy:Telescope live_grep default_text=<C-r>z<cr>]] },

    -- move selected block
    { keys = '<A-j>',      command = ":m '>+1<CR>gv=gv" },
    { keys = '<A-Down>',   command = ":m '>+1<CR>gv=gv" },
    { keys = '<A-k>',      command = ":m '<-2<CR>gv=gv" },
    { keys = '<A-Up>',     command = ":m '<-2<CR>gv=gv" },
  },
}

local options = { noremap = true, silent = true }

for mode, bindings in pairs(bindings_per_mode) do
  for _, value in pairs(bindings) do
    local is_numeric = string.find(value.keys, '#')

    if is_numeric then
      for i = 1, 9 do
        local keys = string.gsub(value.keys, '#', i)
        local cmd = string.gsub(value.command, '#', i)

        vim.keymap.set(mode, keys, cmd, options)
      end
    else
      vim.keymap.set(mode, value.keys, value.command, options)
    end
  end
end
