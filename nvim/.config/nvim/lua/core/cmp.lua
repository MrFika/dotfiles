local autopairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

autopairs.setup({
  disable_filetype = { "TelescopePrompt", "vim" },
})

require("mason-lspconfig").setup({
  -- For some reason not working....???
  ensure_installed = { "lua_ls", "pyright", "vimls" },
})

-- IMPORTANT: make sure to setup lua-dev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

-- CMP Completion
-- Setup nvim-cmp.
local cmp = require("cmp")

cmp.setup({
  preselect = cmp.PreselectMode.None, -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/17
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    -- For vsnip user.
    { name = "buffer", options = { keyword_length = 5 } },
    { name = "path" },
    { name = "spell" },
    { name = "calc" },
    { name = "vsnip" },
    { name = "treesitter" },
    { name = "nvim_lsp_signature_help" },
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require("cmp-under-comparator").under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = require("lspkind").cmp_format({
      with_text = true,
      menu = {
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        path = "[Path]",
        spell = "[Spell]",
        calc = "[Calc]",
        vsnip = "[Vsnip]",
        treesitter = "[Tree]",
      },
    }),
  },
})

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<leader>gc", vim.lsp.buf.incoming_calls, bufopts)
  vim.keymap.set("n", "<C-space>", vim.lsp.buf.hover, bufopts)
  -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>cf", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
  -- Project wide diagnostics fuzzy find.
  vim.keymap.set("n", "<leader>dl", ":Telescope diagnostics<CR>", bufopts)
  -- Find references & definitions.
  vim.keymap.set("n", "<leader>fr", ":Telescope lsp_references<CR>", bufopts)
  vim.keymap.set("n", "<leader>fd", ":Telescope lsp_definitions<CR>", bufopts)
  -- Highlighting references.
  -- See: https://sbulav.github.io/til/til-neovim-highlight-references/
  -- for the highlight trigger time see: `vim.opt.updatetime`
  -- if client.server_capabilities.documentHighlightProvider then
  --   vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
  --   vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
  --   vim.api.nvim_create_autocmd("CursorHold", {
  --     callback = vim.lsp.buf.document_highlight,
  --     buffer = bufnr,
  --     group = "lsp_document_highlight",
  --     desc = "Document Highlight",
  --   })
  --   vim.api.nvim_create_autocmd("CursorMoved", {
  --     callback = vim.lsp.buf.clear_references,
  --     buffer = bufnr,
  --     group = "lsp_document_highlight",
  --     desc = "Clear All the References",
  --   })
  -- end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lsp_config = require("lspconfig")
lsp_config.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
lsp_config.basedpyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    basedpyright = {
      typeCheckingMode = "standard"
    }
  }
})
lsp_config.ruff_lsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp_config.vimls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp_config.bashls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp_config.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
lsp_config.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
