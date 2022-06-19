local M = {}

function M.setup()
    local on_attach = function(client, bufnr)
      require'jdtls.setup'.add_commands()
      require'jdtls'.setup_dap()
      require'lsp-status'.register_progress()
      
      local cmp = require'cmp'
      local luasnip = require('luasnip')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      
      require('luasnip.loaders.from_vscode').lazy_load()
      vim.api.nvim_command('hi LuasnipChoiceNodePassive cterm=italic')
      vim.opt.completeopt = 'menu,menuone,noselect'
      
      cmp.setup({
          snippet = {
              expand = function(args)
                  require('luasnip').lsp_expand(args.body)
              end,
          },
          formatting = {
              format = function(entry, item)
                  local menu_map = {
                      buffer = '[Buf]',
                      nvim_lsp = '[LSP]',
                      nvim_lua = '[API]',
                      path = '[Path]',
                      luasnip = '[Snip]',
                      rg = '[RG]',
                  }

                  item.menu = menu_map[entry.source.name] or string.format('[%s]', entry.source.name)
                  item.kind = vim.lsp.protocol.CompletionItemKind[item.kind]

                  return item
              end,
          },
          window = {
              completion = {
                  border = 'rounded',
                  winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
              },
              documentation = {
                  border = 'rounded',
                  winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
              },
          },
          mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
              ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4)),
              ['<C-Space>'] = cmp.mapping(cmp.mapping.complete()),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<C-n>'] = {
                  c = function(fallback)
                      local cmp = require('cmp')
                      if cmp.visible() then
                          cmp.select_next_item()
                      else
                          fallback()
                      end
                  end,
              },
              ['<C-p>'] = {
                  c = function(fallback)
                      local cmp = require('cmp')
                      if cmp.visible() then
                          cmp.select_prev_item()
                      else
                          fallback()
                      end
                  end,
              },
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ['<Tab>'] = function(fallback)
                  if cmp.visible() then
                      cmp.select_next_item()
                  elseif luasnip.expand_or_jumpable() then
                      luasnip.expand_or_jump()
                  else
                      fallback()
                  end
              end,
              ['<S-Tab>'] = function(fallback)
                  if cmp.visible() then
                      cmp.select_prev_item()
                  elseif luasnip.jumpable(-1) then
                      luasnip.jump(-1)
                  else
                      fallback()
                  end
              end,
          }),
          sources = cmp.config.sources({
              { name = 'nvim_lsp', priority = 10 },
              { name = 'nvim_lsp_signature_help' },
              { name = 'luasnip' },
          }, {
              { name = 'nvim_lua' },
          }, {
              { name = 'buffer' },
              { name = 'path' },
              { name = 'rg' },
          }),
      })

      require'lspkind'.init()
      require'lspsaga'.init_lsp_saga()

      -- Kommentary
      vim.api.nvim_set_keymap("n", "<leader>/", "<plug>kommentary_line_default", {})
      vim.api.nvim_set_keymap("v", "<leader>/", "<plug>kommentary_visual_default", {})

      require'formatter'.setup{
          filetype = {
              java = {
                  function()
                      return {
                          exe = 'java',
                          args = { '-jar', os.getenv('HOME') .. '/.local/jars/google-java-format.jar', vim.api.nvim_buf_get_name(0) },
                          stdin = true
                      }
                  end
              }
          }
      }

      vim.api.nvim_exec([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.java FormatWrite
        augroup end
      ]], true)

      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      local opts = { noremap=true, silent=true }
      buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
      buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
      buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references() && vim.cmd("copen")<CR>', opts)
      buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
      buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
      -- Java specific
      buf_set_keymap("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", opts)
      buf_set_keymap("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", opts)
      buf_set_keymap("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", opts)
      buf_set_keymap("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
      buf_set_keymap("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
      buf_set_keymap("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

      buf_set_keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

      vim.api.nvim_exec([[
          hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
          hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
          augroup lsp_document_highlight
            autocmd!
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
          augroup END
      ]], false)

    end

    local root_markers = {'gradlew', 'pom.xml'}
    local root_dir = require('jdtls.setup').find_root(root_markers)
    local home = os.getenv('HOME')

    local capabilities = {
        workspace = {
            configuration = true
        },
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }
    }

    local workspace_folder = home .. "/Shubharanjan/code/java/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    local config = {
        flags = {
          allow_incremental_sync = true,
        };
        capabilities = capabilities,
        on_attach = on_attach,
    }

    config.settings = {
        ['java.format.settings.url'] = home .. "/.config/nvim/language-servers/java-google-formatter.xml",
        ['java.format.settings.profile'] = "GoogleStyle",
        java = {
          signatureHelp = { enabled = true };
          contentProvider = { preferred = 'fernflower' };
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*"
            }
          };
          sources = {
            organizeImports = {
              starThreshold = 9999;
              staticStarThreshold = 9999;
            };
          };
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
            }
          };
          -- configuration = {
          --   runtimes = {
          --     {
          --       name = "JavaSE-11",
          --       path = home .. "/.sdkman/candidates/java/11.0.10-open/",
          --     },
          --     {
          --       name = "JavaSE-14",
          --       path = home .. "/.sdkman/candidates/java/14.0.2-open/",
          --     },
          --     {
          --       name = "JavaSE-15",
          --       path = home .. "/.sdkman/candidates/java/15.0.1-open/",
          --     },
          --   }
          -- };
        };
    }
    -- config.cmd = {'/Users/apple/.config/nvim/lua/lsp/java-lsp.sh', workspace_folder}
    config.cmd = {

    -- 💀
    'java', -- or '/path/to/java11_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    -- '--add-modules=ALL-SYSTEM',
    -- '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    -- '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

    -- 💀
    -- '-jar', '~/Shubharanjan/code/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_*.jar',
    '-jar', '/Users/apple/Shubharanjan/code/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version


    -- 💀
    --'-configuration', '~/jdt-language-server-1.9.0-202203031534/config_mac',
    '-configuration', '/Users/apple/Shubharanjan/code/java/jdt-language-server-1.9.0-202203031534/config_mac',
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', vim.fn.expand('$HOME/Shubharanjan/code/java/workspaces/'),
    } 
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end

    -- local jar_patterns = {
    --     '/dev/microsoft/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar',
    --     '/dev/dgileadi/vscode-java-decompiler/server/*.jar',
    --     '/dev/microsoft/vscode-java-test/server/*.jar',
    -- }

    -- local bundles = {}
    -- for _, jar_pattern in ipairs(jar_patterns) do
    --   for _, bundle in ipairs(vim.split(vim.fn.glob(home .. jar_pattern), '\n')) do
    --     if not vim.endswith(bundle, 'com.microsoft.java.test.runner.jar') then
    --       table.insert(bundles, bundle)
    --     end
    --   end
    -- end

    local extendedClientCapabilities = require'jdtls'.extendedClientCapabilities
    extendedClientCapabilities.resolveAdditionalTextEditsSupport = true
    config.init_options = {
      -- bundles = bundles;
      extendedClientCapabilities = extendedClientCapabilities;
    }

    -- UI
    local finders = require'telescope.finders'
    local sorters = require'telescope.sorters'
    local actions = require'telescope.actions'
    local pickers = require'telescope.pickers'
    require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
      local opts = {}
      pickers.new(opts, {
        prompt_title = prompt,
        finder    = finders.new_table {
          results = items,
          entry_maker = function(entry)
            return {
              value = entry,
              display = label_fn(entry),
              ordinal = label_fn(entry),
            }
          end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
          actions.goto_file_selection_edit:replace(function()
            local selection = actions.get_selected_entry(prompt_bufnr)
            actions.close(prompt_bufnr)

            cb(selection.value)
          end)

          return true
        end,
      }):find()
    end

    -- Server
    require('jdtls').start_or_attach(config)
end

return M
