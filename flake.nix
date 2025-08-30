{
  description = "Kesmarag's LaTeX environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      
      myTexLive = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          scheme-small  # A good minimal starting point
          latexmk       # For automated builds (running lualatex, biber, etc.)
          biber         # A modern bibliography tool
          biblatex      # A biblatex-compatible bibliography system

          # Add any other packages your document needs here:
          amsmath
          amsfonts
          enumitem
          algorithms
          minitoc
          wrapfig
          wasy
          wasysym
          capt-of
          greek-fontenc
          algorithmicx
          amsaddr
          accents
          subfigure
          stmaryrd
          systeme
          cancel
          cleveref
          lipsum
          extarrows
          relsize
          bbm
          blkarray
          floatrow
          doublestroke
          xstring
          simplekv
          subfiles
          babel-greek
          gfsartemisia
          tex-gyre
          cm-super
          cbfonts
          collection-langgreek
          rsfs
          ;
      };

    in
    {
      devShells.${system}.default = pkgs.mkShell {
        # The packages available in the shell
        buildInputs = [
          myTexLive
        ];

        # A hook that runs when you enter the shell.
        shellHook = ''
          echo "Welcome to your reproducible LaTeX environment!"
          echo "Run 'latexmk -xelatex main.tex' to build your document."
        '';
      };
    };
}
