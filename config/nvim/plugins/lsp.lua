local _, err = pcall(function()
  vim.lsp.set_log_level("debug")
  -- vim.lsp.set_log_level("info")

  local utils = require('utils')
  local on_attach = function(client, bufnr)
    -- require('completion').on_attach()
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local opts = utils.opts;
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line(\"$\"),0})<CR>", opts)
    end
  end

  local nvim_lsp = require('lspconfig')
  local servers = {'pyright', 'gopls', 'jsonls', 'tsserver'}
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      commands = {
        Format = {
          function()
            vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
          end
        }
      },
    }
  end

  local rust_opts = {
      tools = { -- rust-tools options
          autoSetHints = true,
          hover_with_actions = true,
          runnables = {
              use_telescope = true
          },
          inlay_hints = {
              show_parameter_hints = true,
              parameter_hints_prefix = "<- ",
              other_hints_prefix = "=> ",
              max_len_align = false,
              max_len_align_padding = 1,
              right_align = false,
              right_align_padding = 7
          },
          hover_actions = {
              border = {
                  {"╭", "FloatBorder"}, {"─", "FloatBorder"},
                  {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                  {"╯", "FloatBorder"}, {"─", "FloatBorder"},
                  {"╰", "FloatBorder"}, {"│", "FloatBorder"}
              },
              auto_focus = false
          }
      },
      server = {
        on_attach = on_attach
      } -- rust-analyzer options
  }

  require('rust-tools').setup(rust_opts)
  require'lspconfig'.svelte.setup{
    on_attach=on_attach,
  }

  vim.g.diagnostics_active = true
  function _G.toggle_diagnostics()
    if vim.g.diagnostics_active then
      vim.g.diagnostics_active = false
      vim.lsp.diagnostic.clear(0)
      vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
    else
      vim.g.diagnostics_active = true
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
        vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = true,
          signs = true,
          underline = true,
          update_in_insert = false,
        }
      )
    end
  end

vim.api.nvim_set_keymap('n', '<leader>tt', ':call v:lua.toggle_diagnostics()<CR>',  {noremap = true, silent = true})
end)

if err then
  vim.cmd("echo " .. vim.inspect(err))
end
