{pkgs, ...}: {
  nixpkgs.config = {
    # I want to install packages that are not FOSS sometimes
    allowUnfree = true;
    # A funny little hack to make sure that *everything* is permitted
    allowUnfreePredicate = _: true;

    # I don't really need pkgs.pkgsRocm and so on
    # this list also does not include actually useful sets like pkgsi686Linux
    # however this can also break some packages from building
    allowVariants = false;

    # If a package is broken, I don't want it
    allowBroken = false;
    # But occasionally we need to install some anyway so we can predicated those
    # these are usually packages like electron because discord and others love
    # to take their sweet time updating it
    permittedInsecurePackages = [];

    # I don't want to use aliases for packages, usually because its slow
    # and also because it can get confusing
    allowAliases = false;
  };

  assertions = [
    {
      assertion = pkgs.overlays == [];
      message = "nixpkgs overlays are not allowed in my configurations.";
    }
  ];
}
