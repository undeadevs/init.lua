require 'nvim-treesitter.install'.compilers = { "gcc" }
require 'nvim-treesitter.install'.executables = {
  cmd = "powershell",
  opts = {
    args = { "-NoProfile", "-ExecutionPolicy", "CurrentUser", "RemoteSigned", "-Command" },
    detached = true,
  },
}
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'c',
    'cpp',
    'go',
    'lua',
    'python',
    'rust',
    'tsx',
    'typescript',
    'javascript',
    'vimdoc',
    'vim',
    'java',
    'svelte',
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}

-- EJS stuff cuz it's a pain
vim.cmd.autocmd("BufRead,BufNewFile *.ejs set filetype=ejs")
local ejs_group = vim.api.nvim_create_augroup("EJSAuto", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*.ejs" },
  callback = function(args)
    vim.api.nvim_buf_create_user_command(args.buf, 'EJSBeautify', function(_)
      vim.cmd("!js-beautify --type html -I true -f " ..
        vim.api.nvim_buf_get_name(args.buf) .. " -o " .. vim.api.nvim_buf_get_name(args.buf))
    end, { desc = 'Format current EJS file' })
  end,
  group = ejs_group,
})

vim.treesitter.language.register("html", "ejs")
