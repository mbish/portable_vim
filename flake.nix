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
  };

  outputs = { self, nixpkgs, ranger-vim-src, vim-buftabline-src }:
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
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
      overlays = [
      ];
    };
    vim = vim_configurable.customize {
          name = "vim";
          vimrcConfig.customRC = builtins.concatStringsSep "\n" [
           ''
            scriptencoding utf-8
            set nomodeline

            " Make python3 preeminent
            if has('python3')
            endif

            syntax on
            colorscheme modified_slate
            let g:gruvbox_contrast_dark='hard'
            let g:gruvbox_italic=1
            let g:jedi#goto_stubs_command = 0
            colorscheme gruvbox
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
              fzf-vim
              vim-easymotion
              vim-swap
              gruvbox
              ultisnips
              vim-exchange
              vim-dispatch
              vim-fugitive
              vim-surround
              ale
              vim-go
              vim-markdown
              vim-yaml
              vim-projectionist
              tagbar
              vim-buftabline
              ranger-vim
            ];
          };
      };
    in
  {
    packages.${system} = rec {
      default = vim.override {
        buildInputs = [ 
          pkgs.ranger
          pkgs.fzf
          pkgs.python3
        ] ++ vim.buildInputs; 
      } // {
        propagatedBuildInputs = [
          pkgs.perl
        ];
      };
    };
    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [ vim ];
      };
    };
  };
}
