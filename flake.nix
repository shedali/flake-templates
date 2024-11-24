{
  description = "Franz flake templates";

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
      bun = {
        path = ./bun;
        description="bun.sh project";
      };
      test = {
        path = ./test-unpack;
        description="test unpack";
      };
    };

    defaultTemplate = self.templates.xcfile;

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
