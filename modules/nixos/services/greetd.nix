{...}:
{ 
  services.greetd = {
  enable = false;
  settings = rec {
    initial_session = {
      command = "hyprland > /dev/null 2>&1";
      user = "sayu";
    };
    default_session = initial_session;
    };
  };

}