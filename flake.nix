{
  description = "Franz flake templates";

  outputs = { self }: {
    # Expose each template directly
    templates.bun = { path = ./bun; };
    templates.xcfile = { path = ./xcfile; };
    templates.latex = { path = ./latex; };
    templates.test = { path = ./test-unpack; };

    # Default template
    defaultTemplate = self.templates.bun;
  };
}