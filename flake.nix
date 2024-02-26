{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    templates = {
      xcfile = {
        path = ./xcfile;
        description="xc file interactive markdown";
      };
      latex = {
        path = ./latex;
        description="latex editing";
      };
    };

    defaultTemplate = self.templates.xcfile;

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
