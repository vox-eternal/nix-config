{pkgs, ...}: {
  garden.packages = {
    inherit
      (pkgs)
      grim
      slurp
      mako
      wl-clipboard
      cliphist
      ;
  };
}
