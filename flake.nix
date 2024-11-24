{
  description = "Franz flake templates";

  outputs = { self }: {
    # Templates section
    templates = {
      xcfile = { path = ./xcfile; };
      bun = { path = ./bun; };
      latex = { path = ./latex; };
      test = { path = ./test-unpack; };
    };

    # Packages section for CI
    packages.x86_64-linux = {
      xcfile = self.templates.xcfile;
      bun = self.templates.bun;
      latex = self.templates.latex;
      test = self.templates.test;
    };
  };
}