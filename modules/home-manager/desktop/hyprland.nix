{
  config,
  lib,
  pkgs,
  ...
}: let
  colors = config.vars.base16SchemeNoHash;
in {
  home.packages = with pkgs; [ 
    hyprpaper
    hyprshot
    hyprlock
    ];
  # Source hyprland config from the home-manager store
  xdg.configFile = {
    "hypr/hyprland.conf".text = 
''
monitor=,highres,auto,1 #, bitdepth, 10
exec-once = waybar
exec-once = hyprpaper  
exec-once = gnome-keyring-daemon --start --components=secrets
exec-once = clipse -listen
# exec-once = nm-applet --indicator
# exec-once = kdeconnect-indicator
exec-once = systemctl --user start graphical-session.target
exec-once = hyprlock || hyprctl dispatch exit

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
env = EDITOR,nvim
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

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Q, exec, kitty
bind = $mainMod SHIFT, Q, killactive,
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, wofi --drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, N, togglesplit, # dwindle

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

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Move windows
bind = $mainMod SHIFT, H, movewindow, l
bind = $mainMod SHIFT, L, movewindow, r
bind = $mainMod SHIFT, K, movewindow, u
bind = $mainMod SHIFT, J, movewindow, d 

# Resize windows
binde = $mainMod, H, resizeactive, -10 0
binde = $mainMod, L, resizeactive, 10 0
binde = $mainMod, K, resizeactive, 0 -10
binde = $mainMod, J, resizeactive, 0 10

# Move focus with mainMod + arrow keys
bind = $mainMod CTRL, h, movefocus, l
bind = $mainMod CTRL, l, movefocus, r
bind = $mainMod CTRL, k, movefocus, u
bind = $mainMod CTRL, j, movefocus, d


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
bind = $mainMod SHIFT, PRINT, exec, hyprshot -m region

# Clipboard history
bind = $mainMod SHIFT, V, exec, kitty --class clipse -e 'clipse' 

# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
# See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

windowrule = float,class:^(clipse)$ # ensure you have a floating window class set if you want this behavior
windowrule = size 652 652,class:^(clipse)$ # set the size of the window as necessary

windowrule = suppressevent maximize, class:.* # You'll probably like this.

# No shadow for tiled windows
windowrule = noshadow,floating:0

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
windowrule = opacity 0.96 0.93, class:^([Dd]iscord|[Vv]esktop)$
windowrule = opacity 0.93 0.89, class:^(org.telegram.desktop|io.github.tdesktop_x64.TDesktop)$
windowrule = opacity 0.8 0.7, class:^(app.drey.Warp)$ # Warp File Transfer
windowrule = opacity 0.9 0.8, class:^(seahorse)$ # gnome-keyring GUI
windowrule = opacity 0.82 0.75, class:^(gnome-system-monitor|DP-3rg.gnome.SystemMonitor)DP-3
windowrule = opacity 0.9 0.8, class:^(xdg-desktop-portal-gtk)$ # gnome-keyring GUI
windowrule = opacity 0.9 0.7, class:^([Ww]hatsapp-for-linux)$
windowrule = opacity 0.95 0.75, title:^(Picture-in-Picture)$
windowrule = opacity 0.9 0.9 class:^([RrWw]ofi)$

# Window Size Rules
windowrule = size 70% 70%, class:^(gnome-system-monitor|DP-3rg.gnome.SystemMonitor)DP-3
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

# Do not show notifications on stream
windowrule = noscreenshare, class:^([Ss]waync)$
'';

    "hypr/hyprpaper.conf".text = ''
      splash = false
      preload = ${config.vars.wallpaper}
      wallpaper = , ${config.vars.wallpaper}
    '';

    "hypr/hyprlock.conf".text = ''

background {
  monitor=DP-3
  blur_passes=1
  blur_size=7
  noise=0.011700
  path=screenshot
}

image {
  monitor=DP-3
  halign=center
  # path="/home/sayu/dotfiles/media/profile.png"
  position=0, 50
  valign=center
}

input-field {
  monitor=DP-3
  size=200,50
  check_color=rgb(30, 107, 204)
  dots_center=true
  dots_size=0.200000
  dots_spacing=0.350000
  fade_on_empty=false
  font_color=rgb(111, 45, 104)
  halign=center
  hide_input=false
  inner_color=rgba(0, 0, 0, 0.2)
  outer_color=rgba(0, 0, 0, 0)
  outline_thickness=2
  placeholder_text=<i><span foreground="##cdd6f4">Input Password...</span></i>
  position=0, -100
  rounding=-1
  valign=center
}

label {
  monitor=DP-3
  color=rgba(242, 243, 244, 0.75)
  font_family=JetBrains Mono
  font_size=95
  halign=center
  position=0, 300
  text=$TIME
  valign=center
}

label {
  monitor=DP-3
  color=rgba(242, 243, 244, 0.75)
  font_family=JetBrains Mono
  font_size=22
  halign=center
  position=0, 200
  text=cmd[update:1000] echo $(date +"%A, %B %d")
  valign=center
}
    '';
  };
}
