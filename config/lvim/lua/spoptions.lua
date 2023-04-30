vim.opt.colorcolumn = "120"

lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["Q"] = ":q<CR>"
lvim.keys.normal_mode[""] = "<Plug>(comment_toggle_linewise_current)"
lvim.keys.visual_mode[""] = "<Plug>(comment_toggle_linewise_visual)"

lvim.keys.normal_mode["<leader>tn"] = ":tabnew<cr>"
lvim.keys.normal_mode["<leader>to"] = ":tabonly<cr>"
lvim.keys.normal_mode["<leader>tc"] = ":tabclose<cr>"
lvim.keys.normal_mode["<leader>tm"] = ":tabmove<cr>"

lvim.keys.normal_mode["<leader>H"] = ':Telescope harpoon marks<cr>'
lvim.keys.normal_mode["<leader>HH"] = ':lua require("harpoon.mark").add_file()<cr>'
lvim.keys.normal_mode["<leader>1"] = ':lua require("harpoon.ui").nav_file(1)<cr>'
lvim.keys.normal_mode["<leader>2"] = ':lua require("harpoon.ui").nav_file(2)<cr>'
lvim.keys.normal_mode["<leader>3"] = ':lua require("harpoon.ui").nav_file(3)<cr>'
lvim.keys.normal_mode["<leader>4"] = ':lua require("harpoon.ui").nav_file(4)<cr>'

lvim.keys.normal_mode['gf'] = ':edit <cfile><cr>'

lvim.keys.normal_mode["<leader>rg"] = ":Telescope live_grep<CR>"
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Go to Definiton" }

lvim.lsp.buffer_mappings.normal_mode["<leader>Ts"] = { "<Plug>(toggle-lsp-diag-vtext)", "Toggle diag vtext" }
lvim.lsp.buffer_mappings.normal_mode["<leader>TS"] = { "<Plug>(toggle-lsp-diag-signs)", "Toggle diag signs" }
lvim.lsp.buffer_mappings.normal_mode["<leader>TT"] = { ":ToggleDiag<cr>", "Toggle diag" }

lvim.builtin.nvimtree.setup.sync_root_with_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_root = false

lvim.transparent_window = true

local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

local dismiss = function()
  local notify = require('notify')
  notify.dismiss({})
end
lvim.builtin.which_key.mappings["C"] = { dismiss, "Dismiss notifications" }

lvim.builtin.treesitter.highlight.enable = true

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "ruff", filetypes = { "python" } },
  --   { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { ":ython" } },
  --   {
  --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "prettier",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--print-with", "100" },
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { command = "flake8", filetypes = { "python" } },
  { command = "ruff", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  {
    command = "codespell",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "python" },
  },
}
