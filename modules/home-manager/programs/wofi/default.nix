{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      insensitive = true;
      normal_window = false;
      font = "Jetbrains Mono 16";
      prompt = "Search :3";
      location = "center";
      show = "drun";
      width = "560";
      height = "750";
      key_up = "Ctrl-k";
      key_down = "Ctrl-j";
      term = "kitty";
      allow_images = true;
      columns = 1;
      lines = 8;
      padding = 15;
      no_actions = true;
    };
  };
}