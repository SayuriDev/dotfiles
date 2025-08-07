{
  config,
  lib,
  pkgs,
  ...
}: let
  colors = config.stylix.noHash;
in {

  imports = [
    ../misc/wallpaper
    ../programs/wofi
    ../services/cliphist
    ../services/waybar
    ../services/swaync


  ];
  home.packages = with pkgs; [ 
    hyprpaper
    hyprshot
    ];
  # Source hyprland config from the home-manager store
  xdg.configFile = {
    "hypr/hyprland.conf".text = 
''
monitor=,highres,auto,1 #, bitdepth, 10

exec-once = hyprpaper
exec-once = gnome-keyring-daemon --start --components=secrets
exec-once = nm-applet --indicator
exec-once = wl-paste --watch cliphist store
exec-once = kdeconnect-indicator
exec = pkill waybar && waybar

# Autostart desktop apps
exec-once = vesktop


env = NIXOS_OZONE_WL,1
env = HYPRSHOT_DIR,$HOME/Pictures/Screenshots
env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
env = QT_AUTO_SCREEN_SCALE_FACTOR,1
env = QT_QPA_PLATFORM,wayland

input {
    kb_layout = pl
    follow_mouse = 0
    mouse_refocus = false

    sensitivity = 0
    accel_profile = flat
}

general { 
    gaps_in = 10
    gaps_out = 15

    border_size = 4

    col.active_border = rgba(${colors.base07}ff)
    col.inactive_border = rgba(${colors.base03}ee)
    resize_on_border = false 
    allow_tearing = false

    layout = dwindle
}

decoration {
    rounding = 10
    active_opacity = 1
    inactive_opacity = 1

    blur {
        enabled = true
        size = 8
        passes = 1
        new_optimizations = true
        ignore_opacity = true
        noise = 0
        brightness = 0.8
    }

}
animations {
    enabled = true
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 6, myBezier
    animation = windowsOut, 1, 6, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}
# Layouts settings
dwindle {
    pseudotile = true
    preserve_split = true
}

master {
    orientation = left
    mfact = 0.50
}

# Misc settings
misc {
    force_default_wallpaper = 0
    disable_hyprland_logo = true
    disable_splash_rendering = true
    vrr = 2
}

device {
  name = epic-mouse-v1
  sensitivity = 0
  accel_profile = flat
}

# See https://wiki.hyprland.org/Configuring/Keywords/
$mainMod = SUPER # Sets "Windows" key as main modifier
$shiftMod = SHIFT_SUPER 

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Q, exec, kitty
bind = $mainMod_SHIFT, Q, killactive,
bind = $mainMod_SHIFT, M, exit,
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, wofi --drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Audio controls
bindel =, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%+
bindel =, XF86AudioLowerVolume, exec, wpctl set-volume -l 1.2 @DEFAULT_AUDIO_SINK@ 5%-
bindl =,  XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bindl = , XF86AudioPlay, exec, playerctl --player=spotify,firefox play-pause
bindl = , XF86AudioPrev, exec, playerctl --player=spotify,firefox previous
bindl = , XF86AudioNext, exec, playerctl --player=spotify,firefox next

# Screenshot a window
bind = $mainMod, PRINT, exec, hyprshot -m window
# Screenshot a monitor
bind = , PRINT, exec, hyprshot -m output
# Screenshot a region
bind = $shiftMod, PRINT, exec, hyprshot -m region


# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
# See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

# Example windowrule v1
# windowrule = float, ^(kitty)$

# Example windowrule 
# windowrule = float,class:^(kitty)$,title:^(kitty)$

windowrule = suppressevent maximize, class:.* # You'll probably like this.

# Tearing
# windowrule=immediate,.*\.exe
# windowrule=immediate,class:(steam_app)

# No shadow for tiled windows
windowrule = noshadow,floating:0

#/ ######## Layer rules ########
#  layerrule = xray 1, .*




# Window Position - Centered
windowrule = center, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$
windowrule = center, class:^(Whatsapp-for-linux)$
windowrule = center, title:^(Open File)(.*)$
windowrule = center, title:^(Select a File)(.*)$
windowrule = center, title:^(Open Folder)(.*)$
windowrule = center, title:^(Save As)(.*)$
windowrule = center, title:^(Library)(.*)$
windowrule = center, title:^(File Upload)(.*)$

# Fullscreen/No Blur
windowrule = noblur, class:^gamescope$
windowrule = fullscreen, class:^gamescope$

# Float Rules - File Dialogs and Steam
windowrule = float, class:steam
windowrule = float, title:^(Open File)(.*)$
windowrule = float, title:^(Select a File)(.*)$
windowrule = float, title:^(Open Folder)(.*)$
windowrule = float, title:^(Save As)(.*)$
windowrule = float, title:^(Library)(.*)$
windowrule = float, title:^(File Upload)(.*)$

# Window Position - Specific Classes
windowrule = center, class:^(org.gnome.Nautilus)$, title:^(File Operation Progress)$
windowrule = center, class:^(org.gnome.Nautilus)$, title:^(Confirm to replace files)$
windowrule = move 72% 7%, title:^(Picture-in-Picture)$
windowrule = move 72% 7%, title:^(Firefox)$

# Idle Inhibition for Fullscreen Apps
windowrule = idleinhibit fullscreen, class:^(.*)$
windowrule = idleinhibit fullscreen, title:^(.*)$
windowrule = idleinhibit fullscreen, fullscreen:1

# Move to Workspaces
windowrule = workspace 2, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$
windowrule = workspace 2, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?)$
windowrule = workspace 2, class:^([Gg]oogle-chrome(-beta|-dev|-unstable)?)$
windowrule = workspace 3, class:^([Tt]hunar|org.gnome.Nautilus)$
windowrule = workspace 4, class:^(code|codium|VSCodium)$
windowrule = workspace 5, class:^(com.obsproject.Studio)$
windowrule = workspace 6, class:^([Ss]potify)$
windowrule = workspace 7, class:^([Dd]iscord|[Ww]ebCord|[Vv]esktop)$
windowrule = workspace 7, class:^([Ff]erdium)$
windowrule = workspace 7, class:^([Ww]hatsapp-for-linux)$
windowrule = workspace 8, class:^([Ss]team)$
windowrule = workspace 8, class:^([Ll]utris)$
windowrule = workspace 8 silent, class:^([Gg]amescope)$

# Silent Workspace Move (e.g., virt-manager)
windowrule = workspace 5 silent, class:^(virt-manager)$

# Float Rules - File Dialogs, System, and Other Apps
windowrule = float, class:([Tt]hunar|org.gnome.Nautilus), title:^(File Operation Progress)$
windowrule = float, class:([Tt]hunar|org.gnome.Nautilus), title:^(Confirm to replace files)$
windowrule = float, class:^(xdg-desktop-portal-gtk)$
windowrule = float, class:^(org.gnome.Calculator)$, title:^(Calculator)$
windowrule = float, class:^(code|codium|codium-url-handler|VSCodium)$, title:^(Add Folder to Workspace)$
windowrule = float, class:^([RrWw]ofi)$
windowrule = float, class:^(eog|org.gnome.Loupe|org.kde.gwenview)$ # Image Viewer
windowrule = float, class:^(pavucontrol|org.pulseaudio.pavucontrol|com.saivert.pwvucontrol)$
windowrule = float, class:^(nwg-look|qt5ct|qt6ct)$
windowrule = float, class:^(mpv|com.github.rafostar.Clapper)$
windowrule = float, class:^(nm-applet|nm-connection-editor|blueman-manager)$
windowrule = float, class:^(yad)$ # Icon Browser
windowrule = float, class:^(wihotspot(-gui)?)$ # WiFi Hotspot
windowrule = float, class:^(file-roller|org.gnome.FileRoller)$ # Archive Manager
windowrule = float, class:^([Bb]aobab|org.gnome.[Bb]aobab)$ # Disk Usage Analyzer
windowrule = float, title:^(Kvantum Manager)$
windowrule = float, class:^([Ss]team)$, title:^((?![Ss]team).*|[Ss]team [Ss]ettings)$
windowrule = float, class:^([Qq]alculate-gtk)$
windowrule = float, class:^([Ww]hatsapp-for-linux)$
windowrule = float, class:^([Ff]erdium)$
windowrule = float, title:^(Picture-in-Picture)$

# Opacity Rules - Terminals, Browsers, and Other Apps
windowrule = opacity 0.9 0.7, class:^(Brave-browser(-beta|-dev)?)$
windowrule = opacity 0.95 0.91, class:^([Ff]irefox|org.mozilla.firefox|[Ff]irefox-esr)$
windowrule = opacity 0.9 0.6, class:^([Tt]horium-browser)$
windowrule = opacity 0.9 0.8, class:^([Mm]icrosoft-edge(-stable|-beta|-dev|-unstable)?)$
windowrule = opacity 0.9 0.8, class:^(google-chrome(-beta|-dev|-unstable)?)$
windowrule = opacity 0.94 0.86, class:^(chrome-.+-Default)$ # Chrome PWAs
windowrule = opacity 0.9 0.8, class:^([Tt]hunar|org.gnome.Nautilus)$
windowrule = opacity 0.8 0.6, class:^(pcmanfm-qt)$
windowrule = opacity 0.9 0.8, class:^(Alacritty|kitty)$ # Terminals
windowrule = opacity 0.9 0.7, class:^(VSCodium|codium-url-handler)$
windowrule = opacity 0.9 0.8, class:^(nwg-look|qt5ct|qt6ct|yad)$
windowrule = opacity 0.9 0.8, title:^(Kvantum Manager)$
windowrule = opacity 0.9 0.7, class:^(com.obsproject.Studio)$
windowrule = opacity 0.9 0.7, class:^([Aa]udacious)$
windowrule = opacity 0.9 0.8, class:^(VSCode|code-url-handler)$
windowrule = opacity 0.9 0.8, class:^(jetbrains-.+)$ # JetBrains IDEs
windowrule = opacity 0.93 0.89, class:^([Dd]iscord|[Vv]esktop)$
windowrule = opacity 0.93 0.89, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$
windowrule = opacity 0.8 0.7, class:^(app.drey.Warp)$ # Warp File Transfer
windowrule = opacity 0.9 0.8, class:^(seahorse)$ # gnome-keyring GUI
windowrule = opacity 0.82 0.75, class:^(gnome-system-monitor|org.gnome.SystemMonitor)$
windowrule = opacity 0.9 0.8, class:^(xdg-desktop-portal-gtk)$ # gnome-keyring GUI
windowrule = opacity 0.9 0.7, class:^([Ww]hatsapp-for-linux)$
windowrule = opacity 0.95 0.75, title:^(Picture-in-Picture)$

# Window Size Rules
windowrule = size 70% 70%, class:^(gnome-system-monitor|org.gnome.SystemMonitor)$
windowrule = size 70% 70%, class:^(xdg-desktop-portal-gtk)$
windowrule = size 60% 70%, title:^(Kvantum Manager)$
windowrule = size 60% 70%, class:^(qt6ct)$
windowrule = size 70% 70%, class:^(evince|wihotspot(-gui)?)$
windowrule = size 60% 70%, class:^(file-roller|org.gnome.FileRoller)$
windowrule = size 60% 70%, class:^([Ww]hatsapp-for-linux)$
windowrule = size 60% 70%, class:^([Ff]erdium)$

 # Make discord screensharing work
windowrule = opacity 0.0 override, class:^(xwaylandvideobridge)$
windowrule = noanim, class:^(xwaylandvideobridge)$
windowrule = noinitialfocus, class:^(xwaylandvideobridge)$
windowrule = maxsize 1 1, class:^(xwaylandvideobridge)$
windowrule = noblur, class:^(xwaylandvideobridge)$
windowrule = nofocus, class:^(xwaylandvideobridge)$
'';

    "hypr/hyprpaper.conf".text = ''
      splash = false
      preload = ${config.wallpaper}
      wallpaper = , ${config.wallpaper}
    '';

    # "hypr/hypridle.conf".text = ''
    #   general {
    #     lock_cmd = pidof hyprlock || dynamic-hyprlock
    #     before_sleep_cmd = loginctl lock-session
    #     after_sleep_cmd = hyprctl dispatch dpms on
    #   }
    # '';
  };
}
