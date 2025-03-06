{
  description = "Franz flake templates";

  outputs = { ... }: {
    templates = {
      bun = {
        path = ./bun;
        description = "A template for bun.sh projects";
      };
      xcfile = {
        path = ./xcfile;
        description = "A template for interactive markdown files";
      };
      latex = {
        path = ./latex;
        description = "A template for LaTeX projects";
      };
      pnpm = {
        path = ./pnpm;
        description = "A template for pnpm";
      };
      test = {
        path = ./test-unpack;
        description = "A template for testing unpacking setups";
      };
    };
  };
}