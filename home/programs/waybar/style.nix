{ config, ... }:
{
  programs.waybar.style = ''
    @define-color fgcolor #74c7ec;
    @define-color bgcolor rgba(40, 50, 70, 0.9);
    @define-color alertcolor #ffbf00;
    @define-color warningcolor #ff0000;
    * {
        font-family: Font Awesome, JetBrainsMono Nerd Font Propo;
        font-size: 20px;
    }

    window#waybar {
        background-color: @bgcolor;
        color: @fgcolor;
        border-radius: 10px;
        transition-property: background-color;
        transition-duration: .5s;
    }

    window#waybar.hidden {
        opacity: 0.2;
    }


    #clock,
    #battery,
    #cpu,
    #memory,
    #disk,
    #temperature,
    #backlight,
    #network,
    #pulseaudio,
    #tray,
    #window {
        padding: 4px 2px;
    }

    #workspaces {
        padding: 4px 10px;
    }

    #workspaces button {
        color: @fgcolor;
        border-radius: 5px;  
    }
    #workspaces button:hover {
        background: transparent;
        box-shadow: inset -2px 3px @fgcolor;
    }

    #workspaces button.active {
        box-shadow: inset 2px -3px @fgcolor;
    }

    #workspaces button.urgent {
        color: @alertcolor;
    }


    .modules-left:first-child {
        margin-left: 10px;
    }
    .modules-right:last-child {
        margin-right: 10px;
    }

    #battery.warning:not(.charging) {
        color: @alertcolor;
    }
    #battery.critical:not(.charging) {
        color: @warningcolor;
    }
    #battery.full.plugged {
        color: @alertcolor;
    }

    #network.disconnected {
        color: @alertcolor;
    }

    #pulseaudio.muted {
        background-color: transparent;
        color: @alertcolor;
    }

    #temperature.critical {
        color: @warningcolor;
    }

    #tray {
        background-color: #2980b9;
    }

    #tray > .passive {
        -gtk-icon-effect: dim;
    }

    #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        color: @alertcolor;
    }


  '';
}
