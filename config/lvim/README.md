# Lunarvim config

Avoid changing any settings on default `config.lua`, only appending to end of file:

```lua
require('spoptions')
require('spplugins')
```

On a different machine i may install other plugins appending one more require to `config.lua`, and using:

```lua
table.insert(lvim.plugins, {
  'vimwiki/vimwiki',
  config = function()
    vim.cmd("let g:vimwiki_key_mappings = { 'all_maps': 0, }")
  end
})
```
