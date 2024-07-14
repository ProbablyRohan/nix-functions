{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  outputs = inputs@{ self, nixpkgs }: 
  let 
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    lib = import ./lib.nix { inherit pkgs; };
  };
}