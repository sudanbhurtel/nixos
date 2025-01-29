{ config, ... }:
{

  programs.wlogout.style = ''
    @define-color fgcolor #74c7ec;
    @define-color box-color rgba(40, 50, 70, 0.95);
    @define-color window-color rgba(10, 10, 20, 0.5);
    @define-color border-color #095579;
    @define-color selection-color #6600cc;

    * { font-family: JetBrainsMono Nerd Font Propo;
        font-size: 25px;
        color: @fgcolor;
      }

       window {
           background-color: @window-color;
           
       }
       
       button {
        border: 6px solid @border-color;
        border-radius: 25px;
        margin: 6px;
        background: @box-color;
    	background-repeat: no-repeat;
    	background-position: center;
    	background-size: 25%;
    }
    button:focus, button:active, button:hover {
        border-color: @selection-color;
        border-radius: 50px;
    }
    #lock {
        background-image: image(url("/nix/store/ahy29dg1hqk2gm90v3z81mp48r4qhhwv-wlogout-1.2.2/share/wlogout/icons/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
    }

    #logout {
        background-image: image(url("/nix/store/ahy29dg1hqk2gm90v3z81mp48r4qhhwv-wlogout-1.2.2/share/wlogout/icons/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
    }

    #suspend {
        background-image: image(url("/nix/store/ahy29dg1hqk2gm90v3z81mp48r4qhhwv-wlogout-1.2.2/share/wlogout/icons/suspend.png"), url("/usr/local/share/wlogout/icons/suspend.png"));
    }

    #hibernate {
        background-image: image(url("/nix/store/ahy29dg1hqk2gm90v3z81mp48r4qhhwv-wlogout-1.2.2/share/wlogout/icons/hibernate.png"), url("/usr/local/share/wlogout/icons/hibernate.png"));
    }

    #shutdown {
        background-image: image(url("/nix/store/ahy29dg1hqk2gm90v3z81mp48r4qhhwv-wlogout-1.2.2/share/wlogout/icons/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
    }

    #reboot {
        background-image: image(url("/nix/store/ahy29dg1hqk2gm90v3z81mp48r4qhhwv-wlogout-1.2.2/share/wlogout/icons/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
    }
  '';
}
