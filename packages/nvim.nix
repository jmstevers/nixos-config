{ inputs, system, ... }:
let
  config = {
    opts = {
      cursorline = true;
      number = true;
      relativenumber = true;
      shell = "nu";
      shiftwidth = 4;
    };
    plugins = {
      noice.enable = true;
      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          fzf-native.enable = true;
          media-files.enable = true;
          frecency.enable = true;
        };
      };
      which-key.enable = true;
      web-devicons.enable = true;
      treesitter.enable = true;
      treesitter-textobjects.enable = true;
      treesitter-context.enable = true;
      treesitter-refactor.enable = true;
      nvim-surround.enable = true;
      dashboard.enable = true;
      trouble.enable = true;
      direnv.enable = true;
      coq-nvim = {
        enable = true;
        settings = {
          auto_start = true;
        };
      };
      neogit.enable = true;
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "catppuccin";
          };
        };
      };
      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          biome.enable = true;
          html.enable = true;
          htmx.enable = true;
          jsonls.enable = true;
          nil_ls.enable = true;
          nushell.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
          };
          svelte.enable = true;
          tailwindcss.enable = true;
          tinymist.enable = true;
          ts_ls.enable = true;
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            html = [
              "biome"
              "rustywind"
            ];
            css = [ "biome" ];
            javascript = [
              "biome"
              "rustywind"
            ];
            typescript = [
              "biome"
              "rustywind"
            ];
            lua = [ "stylua" ];
            json = [ "biome" ];
            rust = [ "rustfmt" ];
            zig = [ "zigfmt" ];
            nix = [ "nixfmt" ];
            nushell = [ "nufmt" ];
          };
          formatters = {
            formatWithErrors = true;
          };
          format_on_save = {
            timeout_ms = 200;
            lsp_format = "fallback";
          };
        };
      };
    };
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        integrations = {
          dashboard = true;
          noice = true;
          nvim_surround = true;
          treesitter = true;
          treesitter_context = true;
          telescope = true;
          lsp_trouble = true;
          which_key = true;
        };
        flavour = "macchiato";
        transparent_background = false;
      };
    };
    globals.mapleader = " ";
    keymaps = [
      {
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
      }
      {
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
      }
      {
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
      }
      {
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
      }
    ];
  };
in
{
  environment.systemPackages = [ (inputs.nixvim.legacyPackages.${system}.makeNixvim config) ];
}
