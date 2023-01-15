{
  description = "A very basic flake";

  inputs = {
    ranger-vim-src = {
      url = "github:francoiscabrol/ranger.vim";
      flake = false;
    };
    vim-buftabline-src = {
      url = "github:ap/vim-buftabline";    
      flake = false;
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, ranger-vim-src, vim-buftabline-src, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
      vim_configurable = pkgs.vim_configurable.override { python3 = pkgs.python3; };
      ranger-vim = pkgs.vimUtils.buildVimPlugin {
        name = "ranger-vim";
        src = ranger-vim-src;
      };
      vim-buftabline = pkgs.vimUtils.buildVimPlugin {
        name = "vim-buftabline";
        src = vim-buftabline-src;
      };
      pkgs = import nixpkgs {
        inherit system;
        config = {allowUnfree = true;};
        overlays = [
        ];
      };

      # TODO fix ALE's access to various linting tools
      vim = vim_configurable.customize {
            name = "vim";
            vimrcConfig.customRC = builtins.concatStringsSep "\n" [
             ''
              scriptencoding utf-8
              set nomodeline

              " Make python3 preeminent
              if has('python3')
              endif

              colorscheme slate
              syntax on
              let g:gruvbox_contrast_dark='hard'
              let g:gruvbox_italic=1
              let g:jedi#goto_stubs_command = 0
              let g:ranger_command_override = "${pkgs.ranger}/bin/ranger"
              colorscheme gruvbox

              " hack to assure scripts that this plugin exists
              " in this version
              let plugs = {'coc.nvim': 1}
              ''
              (builtins.readFile ./functions.vim)
              (builtins.readFile ./keys.vim)
              (builtins.readFile ./options.vim)
              (builtins.readFile ./vars.vim)
              (builtins.readFile ./command.vim)
              (builtins.readFile ./aucmds.vim)
              (builtins.readFile ./highlight.vim)
            ];
            vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
              start = [
                ale
                direnv-vim
                fzf-vim
                gruvbox
                ranger-vim
                rust-vim
                tagbar
                ultisnips
                vim-buftabline
                vim-dispatch
                vim-easymotion
                vim-exchange
                vim-fugitive
                vim-go
                vim-markdown
                vim-nix
                vim-projectionist
                vim-surround
                vim-swap
                vim-yaml
                vim-plug
                vimwiki
                coc-nvim
              ];
            };
        };
      in
    {
      packages = rec {
        default = vim.override {
          buildInputs = [ 
            pkgs.ranger
            pkgs.fzf
            pkgs.python3
            pkgs.bat
            pkgs.zsh
            pkgs.statix
            pkgs.nixpkgs-fmt
          ] ++ vim.buildInputs; 
        } // {
          propagatedBuildInputs = [
            pkgs.perl
            pkgs.node
          ];
        };
      };
      devShells = {
        default = pkgs.mkShell {
          buildInputs = [ vim ];
        };
      };
    }
  );
}
