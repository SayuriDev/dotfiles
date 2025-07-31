{...}: {
  programs.wofi = {
    enable = true;
    settings = {
      insensitive = true;
      normal_window = true;
      prompt = "Search...";
      location = "center";
      show = "drun";
      width = "700";
      height = "420";
      key_up = "Ctrl-k";
      key_down = "Ctrl-j";
      term = "kitty";
      allow_images = true;
    };
  };
}