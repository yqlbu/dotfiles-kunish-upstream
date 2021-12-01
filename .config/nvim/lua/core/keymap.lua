local M = {}

local wk = require "which-key"
local hop = require "hop"
local telescope_builtin = require "telescope.builtin"

function M.setup()
  wk.setup()

  -- hop
  wk.register {
    s = {
      function()
        hop.hint_lines_skip_whitespace()
      end,
      "HopLine",
    },
    S = {
      function()
        hop.hint_char1()
      end,
      "HopChar",
    },
  }

  -- barbar
  wk.register({
    b = {
      name = "Buffer",

      b = { "<cmd>BufferPick<CR>", "BufferPick" },
      C = { "<cmd>BufferClose<CR>", "BufferClose" },
      o = { "<cmd>BufferOrderByBufferNumber<CR>", "BufferOrder ByNumber" },
      O = { "<cmd>BufferCloseAllButCurrent<CR>", "BufferCloseAll ButCurrent" },
      h = { "<cmd>BufferMovePrevious<CR>", "BufferMove Previous" },
      l = { "<cmd>BufferMoveNext<CR>", "BufferMove Next" },
      H = { "<cmd>BufferCloseBuffersLeft<CR>", "BufferClose Left" },
      L = { "<cmd>BufferCloseBuffersRight<CR>", "BufferClose Right" },
    },
  }, {
    prefix = "<Leader>",
  })

  wk.register {
    ["<Tab>"] = { "<cmd>BufferNext<CR>", "Buffer Next" },
    ["<S-Tab>"] = { "<cmd>BufferPrevious<CR>", "Buffer Previous" },
  }

  -- telescope
  wk.register({
    f = {
      name = "Find",

      a = {
        function()
          telescope_builtin.builtin()
        end,
        "Telescope Builtin",
      },
      b = {
        function()
          telescope_builtin.buffers()
        end,
        "Telescope Buffers",
      },
      f = {
        function()
          telescope_builtin.find_files()
        end,
        "Telescope Find Files",
      },
      g = {
        function()
          telescope_builtin.git_commits()
        end,
        "Telescope Git Commits",
      },
      h = {
        function()
          telescope_builtin.help_tags()
        end,
        "Telescope Help",
      },
      j = {
        function()
          telescope_builtin.jumplist()
        end,
        "Telescope Jump List",
      },
      k = {
        function()
          telescope_builtin.keymaps()
        end,
        "Telescope Keymaps",
      },
      l = {
        function()
          telescope_builtin.file_browser()
        end,
        "Telescope File Browser",
      },
      m = {
        function()
          telescope_builtin.man_pages()
        end,
        "Telescope Man Pages",
      },
      s = {
        function()
          telescope_builtin.live_grep()
        end,
        "Telescope Live Grep",
      },
    },
  }, {
    prefix = "<Leader>",
  })

  -- buffer fuzzy finder
  wk.register {
    ["\\"] = {
      function()
        telescope_builtin.current_buffer_fuzzy_find()
      end,
      "Telescope Buffer Search",
    },
  }

  -- nvimtree
  wk.register({
    ft = {
      function()
        require("nvim-tree").toggle(true)
      end,
      "File Tree",
    },
  }, { prefix = "<Leader>" })

  -- fugitive
  wk.register({
    g = {
      name = "Git",

      g = { "<cmd>Git<CR>", "Git Status" },
      p = { "<cmd>Git pull<CR>", "Git Pull" },
      P = { "<cmd>Git push<CR>", "Git Push" },
    },
  }, {
    prefix = "<Leader>",
  })

  -- packer
  wk.register({
    P = {
      function()
        require("packer").sync()
      end,
      "Package Sync",
    },
  }, {
    prefix = "<Leader>",
  })

  -- undotree
  wk.register({
    U = { "<cmd>UndotreeToggle<CR>", "UndoTree Toggle" },
  }, { prefix = "<Leader>" })

  -- custom
  wk.register {
    ["<C-s>"] = { "<cmd>write<CR>", "Buffer Save" },
    ["<C-h>"] = { "<cmd>wincmd h<CR>", "Window Left" },
    ["<C-l>"] = { "<cmd>wincmd l<CR>", "Window Right" },
    ["<C-k>"] = { "<cmd>wincmd k<CR>", "Window Top" },
    ["<C-j>"] = { "<cmd>wincmd j<CR>", "Window Bottom" },
  }
end

function M.buf_register(bufnr)
  wk.register({
    l = {
      name = "LSP",

      a = {
        function()
          vim.lsp.buf.code_action()
        end,
        "LSP Code Actions",
      },

      r = {
        function()
          vim.lsp.buf.rename()
        end,
        "LSP Rename",
      },

      R = {
        function()
          vim.lsp.buf.references()
        end,
        "LSP References",
      },

      i = {
        function()
          vim.lsp.buf.implementation()
        end,
        "LSP Implementations",
      },

      t = {
        function()
          vim.lsp.buf.type_definition()
        end,
        "LSP Type Definitions",
      },

      s = {
        function()
          vim.lsp.buf.document_symbol()
        end,
        "LSP Document Symbols",
      },

      S = {
        function()
          vim.lsp.buf.workspace_symbol()
        end,
        "LSP Workspace Symbols",
      },

      e = {
        function()
          vim.lsp.diagnostic.show_line_diagnostics()
        end,
        "Diagnostics Show Line",
      },

      E = {
        function()
          vim.lsp.diagnostic.set_loclist()
        end,
        "Diagnostics Show Document",
      },

      f = {
        function()
          vim.lsp.buf.formatting()
        end,
        "LSP Format",
      },
    },
  }, {
    prefix = "<Leader>",
    buffer = bufnr,
  })

  wk.register({
    gd = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP Definitions",
    },
    gD = {
      function()
        vim.lsp.buf.declaration()
      end,
      "LSP Declaration",
    },
    K = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP Hover",
    },
    ["[e"] = {
      function()
        vim.lsp.diagnostic.goto_prev()
      end,
      "LSP Diagnostic Prev",
    },
    ["]e"] = {
      function()
        vim.lsp.diagnostic.goto_next()
      end,
      "LSP Diagnostic Next",
    },
  }, {
    buffer = bufnr,
  })
end

return M
