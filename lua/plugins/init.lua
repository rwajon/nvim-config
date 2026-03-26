return {
  -- ── THEME: VSCode dark+ ───────────────────────────────────────────────────
  {
    "Mofiqul/vscode.nvim",
    lazy  = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        style             = "dark",     -- "dark" or "light"
        transparent       = false,
        italic_comments   = true,
        disable_nvimtree_bg = true,
      })
      require("vscode").load()
    end,
  },

  -- ── STATUSLINE ──────────────────────────────────
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme           = "vscode",
        globalstatus    = true,
        component_separators = "",
        section_separators  = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },    -- relative path
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- ── TABLINE ────────────────────────────────────
  {
    "akinsho/bufferline.nvim",
    version      = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        mode              = "buffers",
        numbers           = "none",
        close_command     = "bdelete! %d",
        diagnostics       = "nvim_lsp",
        show_buffer_icons = true,
        show_close_icon   = true,
        separator_style   = "thin",
      },
    },
  },

  -- ── FILE EXPLORER ───────────────────────────────
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch       = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = true,
      window = { width = 30 },
      filesystem = {
        filtered_items = {
          visible     = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = true },
      },
    },
  },

  -- ── FUZZY FINDER ───────────────────────
  {
    "nvim-telescope/telescope.nvim",
    branch       = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy  = "horizontal",
          sorting_strategy = "ascending",
          layout_config    = { prompt_position = "top" },
          mappings = {
            i = {
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- ── LSP ─────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls", "ts_ls", "pyright",
          "html", "cssls", "jsonls",
          "bashls", "gopls", "rust_analyzer"
        },
        automatic_installation = true,
      })

      -- Neovim 0.11+ native LSP API (replaces lspconfig "framework")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Apply capabilities to all servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Per-server overrides
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },  -- suppress "undefined global vim"
            workspace   = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            gofumpt = true,
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
          },
        },
      })

      -- Enable servers
      vim.lsp.enable({
        "lua_ls", "ts_ls", "pyright",
        "html", "cssls", "jsonls",
        "bashls", "gopls", "rust_analyzer"
      })

      -- diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        virtual_text     = true,   -- inline errors
        signs            = true,
        underline        = true,
        update_in_insert = false,  -- don't lint while typing
        severity_sort    = true,
        float = { border = "rounded", source = "always" },
      })
    end,
  },

  -- ── AUTOCOMPLETION ────────────────────────
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",   -- VSCode-bundled snippets
      "onsails/lspkind.nvim",           -- VSCode-style icons in completion
    },
    config = function()
      local cmp     = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"]  = cmp.mapping.complete(),          -- Ctrl+Space triggers completion
          ["<CR>"]       = cmp.mapping.confirm({ select = true }),
          ["<Tab>"]      = cmp.mapping(function(fallback)   -- Tab accepts
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"]    = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Esc>"]      = cmp.mapping.abort(),
          ["<C-u>"]      = cmp.mapping.scroll_docs(-4),
          ["<C-d>"]      = cmp.mapping.scroll_docs(4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode   = "symbol_text",
            maxwidth = 50,
          }),
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },

  -- ── SYNTAX HIGHLIGHTING ──────────
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = 'master',
    opts  = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "javascript", "typescript",
        "python", "html", "css", "json", "markdown", "bash",
      },
      highlight  = { enable = true },
      indent     = { enable = true },
      autotag    = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- ── AUTOPAIRS (auto-closes brackets) ───────────────────────────────
  {
    "windwp/nvim-autopairs",
    event  = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,    -- use treesitter
      })
      -- Integrate with cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- ── COMMENTS ──────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- ── GIT ───────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
      },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function bmap(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end
        -- Stage hunk
        bmap("n", "<leader>gs", gs.stage_hunk,   "Stage hunk")
        bmap("n", "<leader>gr", gs.reset_hunk,   "Reset hunk")
        bmap("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
        bmap("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
      end,
    },
  },

  -- ── TERMINAL (integrated terminal) ────────────────────────────────
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping    = [[<C-`>]],
      direction       = "horizontal",
      size            = 15,
      shade_terminals = true,
      persist_mode    = true,
    },
  },

  -- ── INDENT GUIDES ─────────────────────
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" },
      scope  = { enabled = true },
    },
  },

  -- ── BREADCRUMBS / WINBAR────────────────────────────
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = { lsp = { auto_attach = true } },
  },

  -- ── WHICH-KEY (shows keybinds) ──────
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts  = {},
  },

  -- ── MULTI-CURSOR ─────────────────────────────
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      -- Ctrl+D "Add next occurrence"
      vim.g.VM_maps = {
        ["Find Under"]         = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
      }
    end,
  },

  -- ── SURROUND (wrap selection with brackets/quotes) ───────────────
  {
    "kylechui/nvim-surround",
    version = "*",
    event   = "VeryLazy",
    opts    = {},
  },

  -- ── NOTIFICATIONS ───────────────────────────
  {
    "rcarriga/nvim-notify",
    opts = {
      stages   = "fade",
      timeout  = 3000,
      max_width = 50,
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },

  -- ── TROUBLE ──────────────────────────────────────
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
      { "<C-S-m>", "<cmd>TroubleToggle<CR>", desc = "Toggle Problems panel" },
    },
    opts = { use_diagnostic_signs = true },
  },

}
