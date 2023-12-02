{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    templates = {
      example = {
        path = ./xcfile;
        description="xc file interactive markdown";
      };
    };

    defaultTemplate = self.templates.example;

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
