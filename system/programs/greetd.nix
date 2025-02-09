services.greetd = {
  enable = true;
  settings = rec {
    initial_session = {
      command = "${pkgs.sway}/bin/sway";
      user = "myuser";
    };
    default_session = initial_session;
  };
};