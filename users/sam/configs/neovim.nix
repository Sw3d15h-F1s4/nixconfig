{ config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      gruvbox-material
      mini-nvim
      nvim-tree-lua
      nvim-web-devicons
      gitsigns-nvim
      telescope-nvim

      # LSP Plugins
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      trouble-nvim
      nvim-autopairs
      comment-nvim

      # completions
      nvim-cmp
      cmp-cmdline
      cmp-path
      cmp-nvim-lua

      # UI Plugins
      noice-nvim
      nvim-notify
      nui-nvim
      which-key-nvim
      lualine-nvim
      bufferline-nvim

    ];


    extraLuaConfig = ''
	vim.cmd(":colorscheme gruvbox-material")

	-- Basic Keymapping
	vim.g.mapleader = " "
	vim.keymap.set('n', '<C-d>', '<C-d>zz')
	vim.keymap.set('n', '<C-u>', '<C-u>zz')
	vim.keymap.set('n', 'n', 'nzzzv')
	vim.keymap.set('n', 'N', 'Nzzzv')
	vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
	vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
	vim.keymap.set('v', '<', '<gv')
	vim.keymap.set('v', '>', '>gv')
	vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
    vim.keymap.set('n', '<C-h>', '<C-w>h')
    vim.keymap.set('n', '<C-j>', '<C-w>j')
    vim.keymap.set('n', '<C-k>', '<C-w>k')
    vim.keymap.set('n', '<C-l>', '<C-w>l')
    vim.keymap.set('n', '<C-Right>', '<cmd> vertical resize +2<CR>')
    vim.keymap.set('n', '<C-Left>', '<cmd> vertical resize -2<CR>')
    vim.keymap.set('n', '<C-Down>', '<cmd> resize +2<CR>')
    vim.keymap.set('n', '<C-Up>', '<cmd> resize -2<CR>')

 	
	-- Settings
	vim.opt.scrolloff = 8
    vim.opt.sidescrolloff = 8
	vim.opt.nu = true
	vim.opt.tabstop = 4
	vim.opt.softtabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.expandtab = true
	vim.opt.smartindent = true
	vim.opt.hlsearch = false
	vim.opt.incsearch = true
	vim.opt.wrap = false
	vim.opt.completeopt = 'menuone'
    vim.opt.termguicolors = true

    vim.opt.cursorline = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.numberwidth = 2
    vim.opt.ruler = false
    vim.opt.shortmess:append "sI"

    vim.opt.signcolumn = "yes"
    vim.opt.splitbelow = true
    vim.opt.splitright = true
    vim.opt.whichwrap:append "<>[]hl"

    -- Setup core plugins
    -- nvim-web-devicons (required for nvim-tree-lua
    require('nvim-web-devicons').setup {

    }

    -- nvim-tree-lua
    require('nvim-tree').setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        git = {
            enable = true,
            ignore = true,
        },
        filesystem_watchers = {
            enable = true,
        },
    }
    vim.keymap.set('n', '<C-n>', '<cmd> NvimTreeToggle <CR>')
    vim.keymap.set('n', '<leader>e', '<cmd> NvimTreeFocus <CR>')
    
    -- gitsigns-nvim
    require('gitsigns').setup {

        on_attach = function(bufnr)
            vim.keymap.set('n', ']c', function() if vim.wo.diff then return "]c" end vim.schedule(function() require('gitsigns').next_hunk() end) return "<Ignore>" end, {expr = true, buffer = bufnr})
            vim.keymap.set('n', '[c', function() if vim.wo.diff then return "[c" end vim.schedule(function() require('gitsigns').prev_hunk() end) return "<Ignore>" end, {expr = true, buffer = bufnr})
            vim.keymap.set('n', '<leader>rh', function() require('gitsigns').reset_hunk() end, {buffer = bufnr})
            vim.keymap.set('n', '<leader>ph', function() require('gitsigns').preview_hunk() end, {buffer = bufnr})
            vim.keymap.set('n', '<leader>gb', function() package.loaded.gitsigns.blame_line() end, {buffer = bufnr})
            vim.keymap.set('n', '<leader>td', function() require('gitsigns').toggle_deleted() end, {buffer = bufnr})
        end,
    }

    -- telescope-nvim
    require('telescope').setup {
        defaults = {
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            file_sorter = require('telescope.sorters').get_fuzzy_file,
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            winblend = 0,
            border = {},
            color_devicons = true,
            mappings = {
                n = { ["q"] = require("telescope.actions").close },
            },
        },
    }
    vim.keymap.set('n', '<leader>ff', '<cmd> Telescope find_files <CR>')
    vim.keymap.set('n', '<leader>fa', '<cmd> Telescope find_files follow=true no_ignore=true hidden=true<CR>')
    vim.keymap.set('n', '<leader>fg', '<cmd> Telescope live_grep <CR>')
    vim.keymap.set('n', '<leader>fb', '<cmd> Telescope buffers <CR>')
    vim.keymap.set('n', '<leader>fh', '<cmd> Telescope help_tags <CR>')
    vim.keymap.set('n', '<leader>fo', '<cmd> Telescope oldfiles <CR>')
    vim.keymap.set('n', '<leader>fz', '<cmd> Telescope current_buffer_fuzzy_find <CR>')
    vim.keymap.set('n', '<leader>fd', '<cmd> Telescope diagnostics <CR>')
    vim.keymap.set('n', '<leader>gc', '<cmd> Telescope git_commits <CR>')
    vim.keymap.set('n', '<leader>gt', '<cmd> Telescope git_status <CR>')
    vim.keymap.set('n', '<leader>fm', '<cmd> Telescope marks <CR>')


    -- Setup LSP/Code Plugins
    -- don't set up lsp servers, since they aren't installed lmao rekt

    -- treesitter
    require('nvim-treesitter.configs').setup {
        highlight = {enable = true, use_languagetree = true},
        indent = {enable = true},
    }

    -- trouble-nvim
    require('trouble').setup {

    }
    vim.keymap.set('n', '<leader>ld', "<cmd> TroubleToggle document_diagnostics <CR>")
    vim.keymap.set('n', '<leader>lw', "<cmd> TroubleToggle workspace_diagnostics <CR>")

    -- nvim-autopairs
    require('nvim-autopairs').setup {

    }

    -- comment-nvim
    require('Comment').setup {

    }

    vim.keymap.set('n', '<leader>/', function() require('Comment.api').toggle.linewise.current() end)
    vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")


    -- Setup Completion
    -- too lazy to do this today
    


    -- Setup UI Plugins
    -- Noice
    require("noice").setup({
        lsp = {
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },

        presets = {
            bottom_search = true,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
        },
    })

    -- nvim-notify
    vim.notify = require("notify")

    -- lualine-nvim
    require('lualine').setup {
        options = {
            theme = 'gruvbox-material',
            component_separators = "",
            section_separators = "",
            disabled_filetypes = { 'NvimTree' }
        },
    }

    -- bufferline-nvim
    require('bufferline').setup {
        options = {
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                }
            },
            custom_filter = function(buf_number, buf_numbers)
                if vim.bo[buf_number].filetype ~= "NvimTree" then return true end
            end,
        }
    }

    vim.keymap.set('n', '<S-l>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<S-h>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineMoveNext<CR>')
    vim.keymap.set('n', '<leader>bh', '<cmd>BufferLineMovePrev<CR>')
    vim.keymap.set('n', '<leader>be', '<cmd>BufferLineSortByExtension<CR>')
    vim.keymap.set('n', '<leader>bd', '<cmd>BufferLineSortByDirectory<CR>')

    -- which-key
    vim.keymap.set('n', '<leader>wk', function() vim.cmd "WhichKey" end)
    require("which-key").setup()


    vim.api.nvim_create_autocmd("FileType", {
        pattern = "qf",
        callback = function()
            vim.opt_local.buflisted = false
        end
        })


    '';
  };
}
